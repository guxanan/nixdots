{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./rofi.nix
    ./waybar.nix
  ];
}
