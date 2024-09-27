{pkgs, ...}: {
  imports = [
    ./plugins.nix
  ];

  programs.obs-studio.enable = true;
}
