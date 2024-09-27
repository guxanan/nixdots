{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./nautilus.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.seahorse.enable = true;
  };
}
