{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.user.services.gpg-import = {
    Unit = {
      Description = "gpg-import";
      Wants = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.writeShellScript "gpg-import" ''
        #!/run/current-system/sw/bin/bash
        gpg --import "${config.home.homeDirectory}/Resources/gpg/host/gpg_host_rsa_key_sec_nopass.asc" "${config.home.homeDirectory}/Resources/gpg/github/gpg_github_rsa_key_sec_nopass.asc"
      ''}";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
