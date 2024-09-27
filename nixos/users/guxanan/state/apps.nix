{config, ...}: {
  environment.persistence."/persist".users.guxanan = {
    directories = [
      # Blender
      ".config/blender"

      # GIMP
      ".config/GIMP"
      ".cache/gimp"
      ".local/share/gegl-0.4"

      # Inkscape
      ".config/inkscape"

      # Krita
      ".local/share/krita"

      # Godot
      ".config/godot"
      ".local/share/godot"
      ".cache/godot"

      # OBS Studio
      ".config/obs-studio"

      # LibreOffice
      ".config/libreoffice"

      # OpenRGB
      ".config/OpenRGB"

      # qBittorrent
      ".config/qBittorrent"
      ".local/share/qBittorrent"
      ".cache/qBittorrent"

      # Telegram
      ".local/share/TelegramDesktop"

      # Thunderbird
      ".thunderbird"
      ".cache/thunderbird"

      # Webcord
      ".config/WebCord"

      # Wireshark
      ".config/wireshark"

      # Librewolf
      ".librewolf"
      ".cache/librewolf"

      # VSCodium
      ".config/VSCodium"

      # Zsh
      ".local/share/zsh"

      # Virtualisation
      ".config/libvirt"
    ];
    files = [
      # KeepassXC
      ".config/keepassxc/keepassxc.ini"

      # Krita
      ".config/kritarc"
    ];
  };
}
