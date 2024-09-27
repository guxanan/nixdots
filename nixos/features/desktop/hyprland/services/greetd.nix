{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.greetd = {
      enable = true;
      vt = 1;
      settings = let
        session = {
          command = "${lib.getExe config.programs.hyprland.package}";
          user = lib.mkMerge [
            (lib.mkIf (builtins.hasAttr "guxanan" config.users.users) "guxanan")
          ];
        };
      in {
        initial_session = session;
        default_session = session;
      };
    };
  };
}
