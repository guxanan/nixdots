{
  config,
  pkgs,
  ...
}: {
  theme = {
    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    gtk = {
      theme = {
        name = "catppuccin-mocha-red-standard";
        package = pkgs.catppuccin-gtk.override {
          accents = ["red"];
          variant = "mocha";
        };
      };

      icons = {
        name = "Yaru";
        package = pkgs.yaru-theme;
      };
    };

    qt = {
      enable = true;
      name = "Catppuccin-Mocha-Red";
      package = [
        (pkgs.catppuccin-kvantum.override {
          variant = "Mocha";
          accent = "Red";
        })

        (pkgs.catppuccin-kde.override {
          flavour = ["mocha"];
          accents = ["red"];
        })
      ];
    };
  };
}
