{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./aagl-on-nix.nix
    ./gamemode.nix
    ./steam.nix
    ./wireshark.nix
  ];

  programs.gamescope.enable = true;
}
