{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "volume-input-check";
  text = ''
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@
  '';
}
