{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
  ];

  gtk.enable = true;
}
