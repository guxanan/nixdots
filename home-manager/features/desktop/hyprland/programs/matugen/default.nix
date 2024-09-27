{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./templates
    ./settings.nix
  ];
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.matugen.enable = false;
  };
}
