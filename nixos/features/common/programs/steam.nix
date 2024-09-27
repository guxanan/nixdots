{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;

    package = pkgs.steam.override {
      extraLibraries = p:
        builtins.attrValues {
          inherit
            (p)
            libxcrypt-legacy
            libffi
            libyaml
            vkbasalt
            ;
        };
    };
  };
}
