{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.wallust.settings = {
      backend = "resized";
      color_space = "lab";
      threshold = 20;
      palette = "dark";
    };
  };
}
