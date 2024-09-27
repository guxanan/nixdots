{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    systemd.user.services.power-profiles-default = {
      Unit = {
        Description = "power-profiles-default";
        Wants = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.power-profiles-daemon}/bin/powerprofilesctl set power-saver";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };

      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };
  };
}
