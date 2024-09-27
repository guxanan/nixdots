{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.hypridle.settings = let
      lockScript = pkgs.writeShellScript "lock-script" ''
        # check if any output is "active"
        wpctl status | ${lib.getExe pkgs.ripgrep} "output.*active" -q
        # only lock if nothing is playing
        if [ $? == 1 ]; then
          loginctl lock-session
        fi
      '';

      monitorOffScript = pkgs.writeShellScript "monitor-off-script" ''
        # check if any output is "active"
        wpctl status | ${lib.getExe pkgs.ripgrep} "output.*active" -q
        # only turn off if nothing is playing
        if [ $? == 1 ]; then
          hyprctl dispatch dpms off
        fi
      '';
    in {
      general = {
        lock_cmd = "pidof hyprlock || ${lib.getExe config.programs.hyprlock.package}";
        before_sleep_cmd = lockScript.outPath;
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = lockScript.outPath;
        }
        {
          timeout = 900;
          on-timeout = monitorOffScript.outPath;
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
