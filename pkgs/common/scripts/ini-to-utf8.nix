{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "ini-to-utf8";
  text = ''
    export LC_ALL="ja_JP.UTF-8"

    # Convert INI from SHIFT-JIS to UTF-8
    for file in *.[iI][nN][iI]; do
      if [ -f "$file" ]; then
        iconv -f SHIFT-JIS -t UTF-8 <"''${file}"> "''${file/%.[iI][nN][iI]/.jak}"
      fi
    done

    # Remove original files
    for file in *.jak; do
      if [ -f "$file" ]; then
        mv "$file" "''${file/%.jak/.ini}"
      fi
    done

    echo "All files have been converted."
  '';
}
