{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    shellAliases = {
      # Manage system in the default location
      up-boot = "sudo nixos-rebuild boot";
      up-clean = "sudo nix-collect-garbage -d";
      up-switch = "sudo nixos-rebuild switch";

      # Manage system
      sys-clean = "sudo nix-collect-garbage -d";
      sys-boot = "sudo nixos-rebuild boot --flake $HOME/NixOS";
      sys-switch = "sudo nixos-rebuild switch --flake $HOME/NixOS";
      sys-error = "journalctl -xe --unit home-manager-${config.home.username}";

      # Manage home-manager
      hm-clean = "nix-collect-garbage -d";
      hm-switch = "home-manager switch --flake $HOME/NixOS";
      hm-gens = "home-manager generations";
      hm-pkgs = "home-manager packages";
      hm-news = "home-manager news --flake $HOME/NixOS";

      all-switch = "sys-switch; hm-switch";
      all-clean = "sys-clean; hm-clean";
      flake-update = "pushd $HOME/NixOS; nix flake update --commit-lock-file; popd";

      change-secrets = "pushd $HOME/NixOS; export SOPS_AGE_KEY=$(ssh-to-age -i $HOME/Resources/ssh/host/ssh_host_ed25519_key -private-key); sops nixos/secrets.yaml; popd";
      gpg-show = "gpg --list-keys --keyid-format=long --with-keygrip";

      pass-open = "pass-tomb-open";
      pass-close = "pass-tomb-close";
    };
  };
}
