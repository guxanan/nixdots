{inputs, ...}: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
    ./enc-root.nix
    ./layout.nix
    ./setup.nix
    ./state.nix
    ./wipe.nix
  ];
}
