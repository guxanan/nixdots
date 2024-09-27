{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.gnome.enable {
    home.packages = builtins.attrValues {
      #------------Apps-------------
      inherit
        (pkgs)
        celluloid
        lollypop
        mission-center
        dconf-editor
        gnome-tweaks
        ;
    };
  };
}
