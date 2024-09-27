{
  lib,
  config,
  ...
}: {
  imports = [
    ./git
    ./obs-studio
    ./ssh
    ./thunderbird
    ./vscodium
    ./zsh
    ./direnv.nix
    ./timidity.nix
  ];

  programs = {
    firefox.enable = true;
    home-manager.enable = true;

    # For Shell
    fzf.enable = true;
    starship.enable = true;
  };

  programs.gpg = {
    enable = true;

    privateKeys = [
      "${config.home.homeDirectory}/Resources/gpg/host/gpg_host_rsa_key_sec_nopass.asc"
      "${config.home.homeDirectory}/Resources/gpg/github/gpg_github_rsa_key_sec_nopass.asc"
    ];

    publicKeys = [
      {
        source = "${config.home.homeDirectory}/Resources/gpg/host/gpg_host_rsa_key_pub.pgp";
        trust = 5;
      }

      {
        source = "${config.home.homeDirectory}/Resources/gpg/github/gpg_github_rsa_key_pub.pgp";
        trust = 5;
      }
    ];

    settings = {
      trust-model = "tofu+pgp";
    };
  };
}
