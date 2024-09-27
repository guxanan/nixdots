{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.gnome.enable {
    dconf.settings."org/gnome/shell".favorite-apps = [
      "firefox.desktop"
      "org.gnome.Console.desktop"
      "org.gnome.SystemMonitor.desktop"
      "org.gnome.Calendar.desktop"
      "thunderbird.desktop"
      "org.gnome.Nautilus.desktop"
      "org.gnome.Lollypop.desktop"
      "com.usebottles.bottles.desktop"
      "net.lutris.Lutris.desktop"
      "com.heroicgameslauncher.hgl.desktop"
      "steam.desktop"
      "webcord.desktop"
      "org.telegram.desktop.desktop"
    ];
  };
}
