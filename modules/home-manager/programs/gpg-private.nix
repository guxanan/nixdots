{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.programs.gpg;

  inherit
    (lib)
    types
    mkOption
    mkIf
    ;

  inherit
    (lib.types)
    nullOr
    str
    either
    listOf
    ;
in {
  options.programs.gpg = {
    privateKeys = mkOption {
      type = nullOr (either str (listOf str));
      default = null;
      description = "";
    };
  };

  config = mkIf (cfg.enable && cfg.privateKeys != null) {
    systemd.user.services.gpg-privateKeys = {
      Unit = {
        Description = "gpg-privateKeys";
        Wants = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.writeShellScript "gpg-privateKeys" ''
          gpg --import ${lib.concatStringsSep " " cfg.privateKeys}
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
}
