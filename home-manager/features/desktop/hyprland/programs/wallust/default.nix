{
  config,
  lib,
  ...
}: {
  imports = [
    ./templates
    ./settings.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.wallust.enable = false;
  };
}
