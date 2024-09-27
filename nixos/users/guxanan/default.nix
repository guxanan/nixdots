{
  config,
  pkgs,
  outputs,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  imports = [
    #./state
    ./settings.nix
  ];

  # Persist entire home
  environment.persistence = {
    "/persist".directories = ["/home/guxanan"];
  };

  home-manager = {
    sharedModules = [./settings.nix];
    users.guxanan = import ../../../home-manager/users/guxanan/${config.networking.hostName}.nix;
  };

  security.sudo = {
    extraRules = [
      {
        users = ["guxanan"];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = ["NOPASSWD"];
          }
          {
            command = "/run/current-system/sw/bin/nix-collect-garbage";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };

  sops.secrets.users-guxanan-password = {neededForUsers = true;};

  users = {
    mutableUsers = false;
    groups.realtime = {};
    users.guxanan = {
      isNormalUser = true;
      extraGroups = ifTheyExist [
        "wheel"
        "video"
        "audio"
        "realtime"
        "network"
        "wireshark"
        "git"
        "libvirtd"
      ];

      hashedPasswordFile = config.sops.secrets.users-guxanan-password.path;
      packages = [
        config.boot.kernelPackages.cpupower
      ];
    };
  };
}
