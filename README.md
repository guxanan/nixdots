# <p align="center">My NixOS configuration</p>

# Info

* This is a work-in-progress configuration for a multi-host/user setup.
* You won't be able to just take this and build it without making manual chanages in multiple parts, as I have my secrets and some other stuff private.

# Features

* [Impermanence](https://github.com/nix-community/impermanence), [sops-nix](https://github.com/Mic92/sops-nix), key-based ssh authentication, different desktop environments per host.

# Modules

* Custom modules for some things like [wallust](https://codeberg.org/explosion-mental/wallust) and [matugen](https://github.com/InioX/matugen).
* Home-Manager module for importing GPG private keys (outside of the NixOS configuration).
* Color modules for [catppuccin](https://github.com/catppuccin/catppuccin) and the [colloid](https://github.com/vinceliuice/Colloid-gtk-theme) nord dark theme with alpha transparency.

# Resources

Configurations I used as reference and copied from:

* https://github.com/Misterio77/nix-starter-configs
* https://github.com/Misterio77/nix-config
* https://github.com/fufexan/dotfiles
