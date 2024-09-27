{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    systemd.user.services = {
      wl-paste = {
        Unit = {
          Description = "wl-paste";
          Wants = ["graphical-session.target"];
          After = ["graphical-session.target"];
        };

        Service = {
          Type = "simple";
          ExecStart = "${pkgs.writeShellScript "wl-paste" ''
            ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store
            ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store
          ''}";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };

        Install = {
          WantedBy = ["graphical-session.target"];
        };
      };
    };
  };
}
