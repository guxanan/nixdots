{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "audio-to-ogg";
  text = ''
    export LC_ALL="ja_JP.UTF-8"

    # Convert MP3, WAV, WMA and FLAC to OGG
    read -rp "Convert all audio files to OGG? (yes/no) > " response
    if [ "$response" = "yes" ]; then
      find . -type f \
        \( -iname "*.[mM][pP]3" -o \
          -iname "*.[wW][aA][vV]" -o \
          -iname "*.[wW][mM][aA]" -o \
          -iname "*.[fF][lL][aA][cC]" \) | \
      while read -r file; do
        ffmpeg -nostdin -loglevel quiet -y -i "$file" \
          -c:a libvorbis -q:a 6 "''${file%.*}.ogg"
        echo "Converted: $file -> ''${file%.*}.ogg"
      done

      # Prompt for removing original files
      read -rp "Delete the original files? (yes/no) > " response
      if [ "$response" = "yes" ]; then
        find . -type f \
          \( -iname "*.[mM][pP]3" -o \
            -iname "*.[wW][aA][vV]" -o \
            -iname "*.[wW][mM][aA]" -o \
            -iname "*.[fF][lL][aA][cC]" \) | \
        while read -r file; do
          rm -- "$file"
          echo "Removed: $file"
        done
        echo "All files have been converted and the original files have been deleted."
      else
        echo "All files have been converted but no original file has been deleted."
      fi
    else
      echo "No file has been converted."
    fi
  '';
}
