{config, ...}: {
  environment.persistence."/persist".users.guxanan = {
    directories = [
      #======================-Native-============================
      # Bottles
      ".local/share/bottles"

      # Lutris
      ".local/share/lutris"
      ".cache/lutris"

      # Heroic
      ".config/heroic"

      # Steam
      ".steam"
      ".local/share/Steam"

      # Wine
      ".wine"
      ".cache/wine"

      # OpenMW
      ".config/openmw"
      ".local/share/openmw"

      # PrismLauncher
      ".local/share/PrismLauncher"

      # GZDoom
      ".config/gzdoom"

      #=====================-Emulators-==========================
      # Dolphin Emulator
      ".config/dolphin-emu"
      ".local/share/dolphin-emu"
      ".cache/dolphin-emu"

      # melonDS
      ".config/melonDS"

      # mgba
      ".config/mgba"

      # PCSX2
      ".config/PCSX2"

      # PPSSPP
      ".config/ppsspp"

      # RPCS3
      ".config/rpcs3"
      ".cache/rpcs3"

      # Ryujinx
      ".config/Ryujinx"
    ];
  };
}
