{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/systemd"
      "/var/lib/nixos"
      "/var/log"
      "/srv"
      "/var/lib/libvirt"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
