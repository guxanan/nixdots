{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (pkgs.vscode-extensions)
    gencer
    ritwickdey
    jnoortheen
    kamadorueda
    kamikillerto
    rust-lang
    ms-vscode
    ;
in {
  programs.vscode.extensions = [
    # HTML/CSS
    gencer.html-slim-scss-css-class-completion
    ritwickdey.liveserver

    # Nix
    jnoortheen.nix-ide
    kamadorueda.alejandra

    # UX
    kamikillerto.vscode-colorize

    # Rust
    rust-lang.rust-analyzer

    # CPP
    ms-vscode.cpptools
  ];
}
