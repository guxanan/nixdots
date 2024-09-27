{
  lib,
  config,
  ...
}: {
  imports = [
    ./gnome-keyring
    ./hypridle
    ./swaync
    ./swayosd
    ./systemd
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services = {
      cliphist.enable = true;
      playerctld.enable = true;
    };
  };
}
