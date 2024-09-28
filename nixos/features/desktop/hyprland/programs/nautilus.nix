{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    environment.systemPackages = [pkgs.nautilus];

    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
  };
}
