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
    services.swaync.enable = true;
  };
}
