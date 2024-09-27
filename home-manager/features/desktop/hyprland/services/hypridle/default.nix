{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.hypridle.enable = true;
  };
}
