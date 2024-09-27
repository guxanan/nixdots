{config, ...}: {
  programs.timidity = {
    enable = true;
    extraConfig = "soundfont ${config.home.homeDirectory}/Resources/TiMidity/GMGSx.sf2";
  };
}
