{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./layout.nix
    ./style.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.wlogout.enable = true;
  };
}
