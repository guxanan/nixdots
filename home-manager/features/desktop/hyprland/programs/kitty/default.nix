{
  config,
  lib,
  ...
}: {
  imports = [
    ./settings.nix
  ];

  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.kitty.enable = true;
  };
}
