{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.gnome.enable {
    dconf.settings = {
      "org/gnome/desktop/app-folders".folder-children = [
        "accessories"
        "education"
        "emulators"
        "gaming"
        "graphics"
        "internet"
        "office"
        "programming"
        "sound---video"
        "system-tools"
      ];

      "org/gnome/desktop/app-folders/folders/accessories" = {
        name = "Accessories";
        categories = ["Utility"];
      };

      "org/gnome/desktop/app-folders/folders/education" = {
        name = "Education";
        categories = ["Education"];
      };

      "org/gnome/desktop/app-folders/folders/emulators" = {
        name = "Emulators";
        categories = ["Emulator"];
      };

      "org/gnome/desktop/app-folders/folders/gaming" = {
        name = "Gaming";
        categories = ["Game"];
      };

      "org/gnome/desktop/app-folders/folders/graphics" = {
        name = "Graphics";
        categories = ["Graphics"];
      };

      "org/gnome/desktop/app-folders/folders/internet" = {
        name = "Internet";
        categories = ["Email" "Network" "WebBrowser"];
      };

      "org/gnome/desktop/app-folders/folders/office" = {
        name = "Office";
        categories = ["Office"];
      };

      "org/gnome/desktop/app-folders/folders/programming" = {
        name = "Programming";
        categories = ["Development"];
      };

      "org/gnome/desktop/app-folders/folders/sound---video" = {
        name = "Sound & Video";
        categories = ["Audio" "AudioVideo" "Video"];
      };

      "org/gnome/desktop/app-folders/folders/system-tools" = {
        name = "System Tools";
        categories = ["System" "Settings"];
      };
    };
  };
}
