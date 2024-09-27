{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./dconf.nix
    ./home.nix
    ./packages.nix
  ];
}
