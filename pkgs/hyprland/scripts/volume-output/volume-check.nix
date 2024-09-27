{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "volume-output-check";
  text = ''
    wpctl get-volume @DEFAULT_AUDIO_SINK@
  '';
}
