{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "audio-to-flac";
  text = ''
    export LC_ALL="ja_JP.UTF-8"

    # Convert WAV and WMA to FLAC
    read -rp "Convert all audio files to FLAC? (yes/no) > " response
    if [ "$response" = "yes" ]; then
      find . -type f \
        \( -iname "*.[wW][aA][vV]" -o \
          -iname "*.[wW][mM][aA]" \) | \
      while read -r file; do
        ffmpeg -nostdin -loglevel quiet -y -i "$file" \
          -c:a flac "''${file%.*}.flac"
        echo "Converted: $file -> ''${file%.*}.flac"
      done

      # Prompt for removing original files
      read -rp "Delete the original files? (yes/no) > " response
      if [ "$response" = "yes" ]; then
        find . -type f \
          \( -iname "*.[wW][aA][vV]" -o \
            -iname "*.[wW][mM][aA]" \) | \
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
