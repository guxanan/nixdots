{
  config,
  lib,
  pkgs,
  ...
}: let
  hostname = config.networking.hostName;
  phase1Systemd = config.boot.initrd.systemd.enable;
in {
  boot.initrd = {
    systemd.enable = true;
    supportedFilesystems = ["btrfs"];
    systemd.services.restore-root = lib.mkIf phase1Systemd {
      description = "Rollback btrfs rootfs";
      wantedBy = ["initrd.target"];
      requires = ["dev-disk-by\\x2dlabel-${hostname}.device"];
      after = [
        "dev-disk-by\\x2dlabel-${hostname}.device"
        "systemd-cryptsetup@${hostname}.service"
      ];
      before = ["sysroot.mount"];
      unitConfig.DefaultDependencies = "no";
      serviceConfig.Type = "oneshot";
      script = ''
        mkdir /tmp -p
        MNTPOINT=$(mktemp -d)
        (
          mount -t btrfs -o subvol=/ /dev/disk/by-label/${hostname} "$MNTPOINT"
          trap 'umount "$MNTPOINT"' EXIT

          echo "Creating needed directories"
          mkdir -p "$MNTPOINT"/persist/var/{log,lib/{nixos,systemd}}

          echo "Cleaning root subvolume"
          btrfs subvolume list -o "$MNTPOINT/root" | cut -f9 -d ' ' |
          while read -r subvolume; do
            btrfs subvolume delete "$MNTPOINT/$subvolume"
          done && btrfs subvolume delete "$MNTPOINT/root"

          echo "Restoring blank subvolume"
          btrfs subvolume snapshot "$MNTPOINT/root-blank" "$MNTPOINT/root"
        )
      '';
    };
  };
}
