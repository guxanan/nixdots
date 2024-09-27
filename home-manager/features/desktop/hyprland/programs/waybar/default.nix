{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./style.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
    };
  };
}
