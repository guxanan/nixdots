{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./mimeApps.nix
    ./portal.nix
  ];
}
