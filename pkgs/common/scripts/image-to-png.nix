{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "image-to-png";
  runtimeInputs = builtins.attrValues {
    inherit
      (pkgs)
      imagemagick
      ;
  };
  text = ''
    # Convert JPG to PNG
    for file in *.[jJ][pP][gG]; do
      if [ -f "$file" ]; then
        mogrify -format png "$file"
      fi
    done

    # Remove original files
    for file in *.[jJ][pP][gG]; do
      if [ -f "$file" ]; then
        rm -- "$file"
      fi
    done

    echo "All files have been converted."
  '';
}
