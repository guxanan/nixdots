{lib, ...}: {
  imports = [
    ./btrfs
    ./amdgpu.nix
    ./openrgb.nix
    #./quietboot.nix
  ];

  # Needed for pipewire on GNOME.
  hardware.pulseaudio = {
    enable = false;
  };
}
