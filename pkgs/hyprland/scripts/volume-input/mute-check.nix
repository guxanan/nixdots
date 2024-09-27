{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "volume-input-mute-check";
  runtimeInputs = builtins.attrValues {
    inherit
      (pkgs)
      volume-input-check
      ;
  };
  text = ''
    volume_status=$(volume-input-check)

    if [[ $volume_status == *"MUTED"* ]]; then
      echo 'true'
    else
      echo 'false'
    fi
  '';
}
