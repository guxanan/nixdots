{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./clipboard.nix
    ./settings.nix
    ./launcher.nix
    ./style.nix
    ./wallpaper.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
  };
}
