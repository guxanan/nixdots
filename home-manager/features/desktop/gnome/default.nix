{lib, ...}: {
  imports = [
    ./extensions.nix
    ./favorites.nix
    ./folders.nix
    ./general.nix
    ./packages.nix
  ];
}
