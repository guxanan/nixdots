{pkgs, ...}: {
  programs.obs-studio.plugins = builtins.attrValues {
    inherit
      (pkgs.obs-studio-plugins)
      obs-vkcapture
      obs-shaderfilter
      obs-pipewire-audio-capture
      obs-move-transition
      obs-gstreamer
      input-overlay
      ;
  };
}
