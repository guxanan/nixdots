{
  config,
  pkgs,
  ...
}: {
  programs.zsh.syntaxHighlighting.styles = {
    "precommand" = "fg=blue,bold";
    "arg0" = "fg=cyan,bold";
    "alias" = "fg=magenta,bold";
  };
}
