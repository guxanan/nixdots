{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./polkit.nix
    ./power-profiles.nix
    ./swww-daemon.nix
    ./wl-paste.nix
  ];
}
