{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    systemd.user.services.swww-daemon = {
      Unit = {
        Description = "swww-daemon";
        Wants = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
        Environment = "PATH=$PATH:${lib.makeBinPath [pkgs.swww]}";
      };

      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };
  };
}
