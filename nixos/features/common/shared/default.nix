{lib, ...}: {
  imports = [
    ./home.nix
    ./nix.nix
    ./sops.nix
    ./zsh.nix
  ];

  programs = {
    appimage.enable = true;
    dconf.enable = true;
  };
}
