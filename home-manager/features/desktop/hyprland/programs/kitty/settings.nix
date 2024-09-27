{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.kitty.settings = {
      background_opacity = "0.5";
      update_check_interval = 0;
      confirm_os_window_close = 0;
    };
  };
}
