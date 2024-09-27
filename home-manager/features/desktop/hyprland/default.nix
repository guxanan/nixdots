{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./services
    ./shared
    ./xdg
    ./settings.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.variables = ["--all"];
    };
  };
}
