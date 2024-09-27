{
  config,
  lib,
  pkgs,
  ...
}: let
  hostname = config.networking.hostName;
in {
  fileSystems."/" = {
    device = "/dev/disk/by-label/${hostname}";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "compress-force=zstd:1"
      "noatime"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-label/${hostname}";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "compress-force=zstd:1"
      "noatime"
    ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-label/${hostname}";
    fsType = "btrfs";
    options = [
      "subvol=persist"
      "compress-force=zstd:1"
      "noatime"
    ];
    neededForBoot = true;
  };

  fileSystems."/swap" = {
    device = "/dev/disk/by-label/${hostname}";
    fsType = "btrfs";
    options = [
      "subvol=swap"
      "noatime"
    ];
  };
}
