{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./openssh.nix
    ./pipewire.nix
    ./udev.nix
  ];

  services.ollama.enable = true;
}
