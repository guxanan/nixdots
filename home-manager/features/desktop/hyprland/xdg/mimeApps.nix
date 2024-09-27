{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = ["org.gnome.Evince.desktop"];
        "application/x-gba-rom" = ["io.mgba.mGBA.desktop"];
        "application/x-nintendo-ds-rom" = ["net.kuribo64.melonDS.desktop"];
        "application/octet-stream" = ["dolphin-emu.desktop"];
        "application/vnd.efi.iso" = ["ppsspp.desktop" "PCSX2.desktop"];

        "image/x-xcursor" = ["codium.desktop"];
        "image/png" = ["org.gnome.eog.desktop"];
        "image/jpg" = ["org.gnome.eog.desktop"];

        "text/plain" = ["codium.desktop"];
        "text/html" = ["firefox.desktop"];

        "inode/directory" = ["org.gnome.Nautilus.desktop"];
      };
    };
  };
}
