{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./directories.nix
    ./fonts.nix
    ./theme.nix
  ];

  home = {
    username = "guxanan";
    homeDirectory = "/home/guxanan";
    stateVersion = "23.11";
    sessionVariables = {
      FLAKE = "$HOME/NixOS";
    };
    packages = builtins.attrValues {
      inherit
        (pkgs)
        #------------Apps-------------
        
        blender
        godot_4
        gimp
        krita
        inkscape
        libreoffice-fresh
        openmw
        webcord
        telegram-desktop
        koboldcpp
        #-------Gaming - Wine----------
        
        winetricks
        #-------Gaming - Launchers------
        
        bottles
        heroic
        lutris
        #-------Gaming - Emulators------
        
        dolphin-emu
        melonDS
        mgba
        pcsx2
        ppsspp
        rpcs3
        ryujinx
        #------------Utils--------------
        
        keepassxc
        qbittorrent
        remmina
        #------------Tools--------------
        
        alejandra
        age
        nvme-cli
        compsize
        sops
        ssh-to-age
        ventoy-full
        #----------My Scripts-----------
        
        audio-to-flac
        audio-to-ogg
        image-to-png
        ini-to-utf8
        mid-to-wav
        unzip-jp
        ;

      inherit
        (pkgs.wineWowPackages)
        stagingFull
        ;

      inherit
        (inputs.nix-alien.packages."x86_64-linux")
        nix-alien
        ;
    };
  };
}
