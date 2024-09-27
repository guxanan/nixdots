{
  config,
  lib,
  ...
}: {
  imports = [
    ./style.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.swayosd = {
      enable = true;
      topMargin = 0.8;
    };
  };
}
