{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    environment = {
      systemPackages = [pkgs.nautilus];
      #sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
      pathsToLink = ["/share/nautilus-python/extensions"];
    };

    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
  };
}
