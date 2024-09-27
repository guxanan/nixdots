{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.password-store = {
      enable = true;
      package = pkgs.pass-wayland.withExtensions (
        exts: [exts.pass-otp exts.pass-tomb]
      );
      settings = {
        PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
      };
    };
  };
}
