{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
  ];

  qt.enable = true;
}
