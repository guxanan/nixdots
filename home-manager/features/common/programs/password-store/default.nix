{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.password-store = {
    enable = true;
    package = pkgs.pass-wayland.withExtensions (
      exts: [exts.pass-otp exts.pass-tomb]
    );
    settings = {
      PASSWORD_STORE_DIR = "${config.home.homeDirectory}/Secrets/.password-store";
      PASSWORD_STORE_TOMB_FILE = "${config.home.homeDirectory}/Secrets/.password.tomb";
      PASSWORD_STORE_TOMB_KEY = "${config.home.homeDirectory}/Secrets/.password.key.tomb";
    };
  };
}
