{lib, ...}: {
  imports = [
    ./deps.nix
    ./nix.nix
    ./pass-tomb.nix
    ./sops.nix
    ./xdg.nix
  ];
}
