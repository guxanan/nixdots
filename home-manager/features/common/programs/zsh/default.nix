{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./aliases.nix
    ./plugins.nix
    ./styles.nix
  ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    historySubstringSearch.enable = true;
    autocd = true;
    dotDir = ".config/zsh";

    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      save = 100000;
      size = 100000;
    };

    initExtra = ''
      bindkey "''${key[Up]}" up-line-or-search
      bindkey "''${key[Down]}" down-line-or-search
    '';
  };
}
