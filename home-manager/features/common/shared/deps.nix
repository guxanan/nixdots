{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      p7zip
      unrar
      unzipNLS
      ffmpeg_6-full
      ffmpegthumbnailer
      hunspell
      mediawriter
      psmisc
      ;

    inherit
      (pkgs.hunspellDicts)
      en-us
      it-it
      ;
  };
}
