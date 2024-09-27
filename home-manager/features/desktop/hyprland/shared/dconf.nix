{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:";
      };

      "org/gnome/nautilus/preferences" = {
        click-policy = "single";
        show-create-link = true;
      };
    };
  };
}
