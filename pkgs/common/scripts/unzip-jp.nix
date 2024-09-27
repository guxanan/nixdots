{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "unzip-jp";
  runtimeInputs = builtins.attrValues {
    inherit
      (pkgs)
      unzipNLS
      ;
  };
  text = ''
    export LC_ALL="ja_JP.UTF-8"
    if [ "$#" -eq 0 ]; then
      echo "Error: no filename. Usage: unzip-jp <filename>"
      exit 1
    fi
    unzip -O shift-jis "$1" || echo "Failed to unzip $1"
  '';
}
