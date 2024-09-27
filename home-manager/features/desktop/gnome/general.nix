{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib.hm.gvariant)
    mkTuple
    mkUint32
    ;
in {
  config = lib.mkIf config.settings.desktop.gnome.enable {
    dconf.settings = {
      "org/gnome/desktop/input-sources" = {
        sources = [(mkTuple ["xkb" "us"]) (mkTuple ["xkb" "it"]) (mkTuple ["ibus" "anthy"]) (mkTuple ["xkb" "ro"])];
        xkb-options = ["terminate:ctrl_alt_bksp" "lv3:menu_switch" "compose:ins"];
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/peripherals/keyboard" = {
        delay = mkUint32 600;
        repeat = true;
        repeat-interval = mkUint32 25;
      };

      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "flat";
      };

      "org/gnome/desktop/session" = {
        idle-delay = mkUint32 0;
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
        titlebar-font = "${config.settings.fontSettings.sansSerif.full}";
      };

      "org/gnome/mutter" = {
        attach-modal-dialogs = true;
        center-new-windows = true;
        check-alive-timeout = mkUint32 60000;
        dynamic-workspaces = true;
        edge-tiling = true;
        experimental-features = ["variable-refresh-rate"];
      };

      "org/gnome/nautilus/preferences" = {
        click-policy = "single";
        show-create-link = true;
      };

      "org/gnome/settings-daemon/plugins/power" = {
        power-button-action = "interactive";
        sleep-inactive-ac-type = "nothing";
      };

      "org/gnome/TextEditor" = {
        restore-session = false;
      };
    };
  };
}
