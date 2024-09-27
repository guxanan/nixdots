{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "volume-ux";
  runtimeInputs = builtins.attrValues {
    inherit
      (pkgs)
      libcanberra-gtk3
      ;
  };
  text = ''
    if ! wpctl status | grep -E 'output.*active'; then
      canberra-gtk-play -i audio-volume-change -d "volume-change"
    fi
  '';
}
