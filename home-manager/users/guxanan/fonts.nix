{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      inter
      jetbrains-mono
      nerdfonts
      ipafont
      ipaexfont
      takao
      ;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji"];

      monospace = [
        "JetBrainsMono Nerd Font Propo"
        "JetBrains Mono Propo"
      ];

      sansSerif = [
        "Inter"
        "Noto Sans"
        "IPAGothic"
        "Noto Sans CJK JP"
      ];

      serif = [
        "Noto Serif"
        "Noto Serif CJK JP"
      ];
    };
  };

  settings.fontSettings = {
    enable = true;

    monospace = {
      weight = "Bold";
      size.int = 11;
    };

    sansSerif = {
      weight = "Bold";
      size.int = 11;
    };
  };
}
