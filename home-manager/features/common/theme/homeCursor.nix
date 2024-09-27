{config, ...}: {
  # Setting up cursors.
  home.pointerCursor = {
    name = config.theme.cursor.name;
    package = config.theme.cursor.package;
    size = config.theme.cursor.size;

    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = config.theme.cursor.name;
    };
  };
}
