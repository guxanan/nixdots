{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.rofi.extraConfig = {
      display-drun = "APPS";
      display-filebrowser = "FILES";
      display-run = "RUN";
      display-window = "WINDOW";
      drun-display-format = "{name}";
      font = "${config.settings.fontSettings.monospace.full}";
      hover-select = true;
      kb-cancel = "Escape,Control+q,MouseSecondary";
      location = 0;
      me-accept-entry = "MousePrimary";
      me-select-entry = "";
      modi = "drun,run,filebrowser,window";
      show-icons = true;
      window-format = "{w} · {c} · {t}";
      xoffset = 0;
      yoffset = 0;
      icon-theme = "Yaru-dark";
    };
  };
}
