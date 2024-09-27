{
  config,
  lib,
  pkgs,
  ...
}: {
  services.hardware.openrgb = {
    enable = false;
    package = pkgs.openrgb-with-all-plugins;
  };
}
