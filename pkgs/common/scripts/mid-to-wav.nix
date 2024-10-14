{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "mid-to-wav";
  text = ''
    export LC_ALL="ja_JP.UTF-8"

    # Convert MIDI to WAV
    read -rp "Convert all MID files to WAV? (yes/no) > " response
    if [ "$response" = "yes" ]; then
      find . -type f \
        \( -iname "*.[mM][iI][dD]" \) | \
      while read -r file; do
        timidity "$file" \
          -Ow -o "''${file%.*}.wav"
        echo "Converted: $file -> ''${file%.*}.wav"
      done

      # Prompt for removing original files
      read -rp "Delete the original files? (yes/no) > " response
      if [ "$response" = "yes" ]; then
        find . -type f \
          \( -iname "*.[mM][iI][dD]" \) | \
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
