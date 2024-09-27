{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./services
    ./security.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.hyprland.enable = true;
  };
}
