{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./aagl-on-nix.nix
    ./gamemode.nix
    ./nix-ld.nix
    ./steam.nix
    ./wireshark.nix
  ];

  programs.gamescope.enable = true;
}
