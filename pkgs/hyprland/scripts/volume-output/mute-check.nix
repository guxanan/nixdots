{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "volume-output-mute-check";
  runtimeInputs = builtins.attrValues {
    inherit
      (pkgs)
      volume-output-check
      ;
  };
  text = ''
    volume_status=$(volume-output-check)

    if [[ $volume_status == *"MUTED"* ]]; then
      echo 'true'
    else
      echo 'false'
    fi
  '';
}
