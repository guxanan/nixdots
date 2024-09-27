{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "audio-to-ogg";
  text = ''
    export LC_ALL="ja_JP.UTF-8"

    # Convert MIDI to WAV
    for file in *.[mM][iI][dD]; do
      if [ -f "$file" ]; then
        timidity "''${file}" -Ow -o "''${file/%.[mM][iI][dD]/.wav}"
      fi
    done

    # Convert MP3, WAV, and WMA to OGG
    for file in *.[mM][pP]3 *.[wW][aA][vV] *.[wW][mM][aA]; do
      if [ -f "$file" ]; then
        ffmpeg -loglevel quiet -y -i "''${file}" -c:a libvorbis -q:a 6 "''${file%.*}.ogg"
      fi
    done

    # Remove original files
    for file in *.[mM][iI][dD] *.[mM][pP]3 *.[wW][aA][vV] *.[wW][mM][aA]; do
      if [ -f "$file" ]; then
        rm -- "$file"
      fi
    done

    echo "All files have been converted."
  '';
}
