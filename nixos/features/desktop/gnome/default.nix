{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.gnome.enable {
    services.xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    services.displayManager.autoLogin = {
      user = lib.mkMerge [
        (lib.mkIf (builtins.hasAttr "guxanan" config.users.users) "guxanan")
      ];
    };

    # Workaround for autoLogin and fast-login crashing
    systemd.services = {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };

    environment.sessionVariables = {
      QT_WAYLAND_DECORATION = "adwaita";
    };

    # Setting the input method.
    i18n.inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = [
        pkgs.ibus-engines.anthy
      ];
    };

    # Excluding packages from the GNOME install.
    environment.gnome.excludePackages = builtins.attrValues {
      inherit
        (pkgs)
        epiphany
        gnome-tour
        gnome-music
        ;
    };
  };
}
