{config, ...}: {
  environment.persistence."/persist".users.guxanan = {
    directories = [
      # Swww
      ".cache/swww"

      # Thunar
      ".config/Thunar"
      ".config/xfce4/xfconf/xfce-perchannel-xml"

      # Matugen
      ".config/matugen"

      # Wallust
      ".config/wallust/results"
      ".cache/wallust"
    ];
    files = [
      # Rofi
      ".cache/rofi3.druncache"
      ".cache/rofi-entry-history.txt"
    ];
  };
}
