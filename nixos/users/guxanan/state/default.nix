{config, ...}: {
  imports = [
    ./apps.nix
    ./gaming.nix
    ./hyprland.nix
  ];

  environment.persistence."/persist".users.guxanan = {
    directories = [
      #======================-General-==========================
      "Desktop"
      "Documents"
      "Downloads"
      "Games"
      "Learning"
      "LLMs"
      "Music"
      "NixOS"
      "Pictures"
      "Projects"
      "Public"
      "Templates"
      "Tools"
      "Videos"

      # Trash
      ".local/share/Trash"

      # Big Cache Data
      ".cache/fontconfig"
      ".cache/mesa_shader_cache"

      #=======================-Gnome-============================
      # Gnome dconf
      ".config/dconf"

      # Gnome Keyrings
      {
        directory = ".local/share/keyrings";
        mode = "0700";
      }

      # Gnome Tracker
      ".cache/tracker3"
    ];
  };
}
