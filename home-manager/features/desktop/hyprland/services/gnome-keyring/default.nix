{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.gnome-keyring = {
      enable = true;
      components = [
        "pkcs11"
        "secrets"
      ];
    };
  };
}
