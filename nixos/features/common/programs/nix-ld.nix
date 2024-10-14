{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nix-ld = {
    enable = true;
    libraries = builtins.attrValues {
      # Required
      inherit
        (pkgs)
        ffmpeg
        libGL
        libva
        pipewire
        vulkan-loader
        wayland
        ;
      inherit
        (pkgs.xorg)
        libX11
        libXcomposite
        libXdamage
        libXext
        libXfixes
        libXrandr
        libxcb
        ;
      inherit
        (pkgs.mesa.llvmPackages.llvm)
        lib
        ;

      # Dependencies
      inherit
        (pkgs)
        alsa-lib
        at-spi2-atk
        cairo
        cups
        dbus
        expat
        glib
        libdrm
        libffi
        libudev0-shim
        libxcrypt
        libxcrypt-legacy
        libxkbcommon
        libyaml
        mesa
        nspr
        nss
        pango
        ;

      # GST
      inherit
        (pkgs.gst_all_1)
        gstreamer
        gst-plugins-base
        gst-plugins-ugly
        gst-plugins-good
        gst-plugins-bad
        ;
    };
  };
}
