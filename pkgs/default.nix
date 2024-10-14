pkgs: rec {
  # Common - Scripts
  audio-to-flac = pkgs.callPackage ./common/scripts/audio-to-flac.nix {};
  audio-to-ogg = pkgs.callPackage ./common/scripts/audio-to-ogg.nix {};
  image-to-png = pkgs.callPackage ./common/scripts/image-to-png.nix {};
  ini-to-utf8 = pkgs.callPackage ./common/scripts/ini-to-utf8.nix {};
  mid-to-wav = pkgs.callPackage ./common/scripts/mid-to-wav.nix {};
  unzip-jp = pkgs.callPackage ./common/scripts/unzip-jp.nix {};

  # Hyprland - Scripts
  volume-input-mute-check = pkgs.callPackage ./hyprland/scripts/volume-input/mute-check.nix {};
  volume-output-mute-check = pkgs.callPackage ./hyprland/scripts/volume-output/mute-check.nix {};
  reload = pkgs.callPackage ./hyprland/scripts/reload.nix {};
  screenshot = pkgs.callPackage ./hyprland/scripts/screenshot.nix {};
  volume-input-check = pkgs.callPackage ./hyprland/scripts/volume-input/volume-check.nix {};
  volume-output-check = pkgs.callPackage ./hyprland/scripts/volume-output/volume-check.nix {};
  volume-ux = pkgs.callPackage ./hyprland/scripts/volume-ux.nix {};
  volume = pkgs.callPackage ./hyprland/scripts/volume.nix {};
}
