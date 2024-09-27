{pkgs, ...}: {
  # Enabling Zsh.
  programs.zsh.enable = true;

  environment = {
    pathsToLink = [
      "/share/zsh"
    ];
    shells = [pkgs.zsh];
  };

  # Setting the shell.
  users.defaultUserShell = pkgs.zsh;
}
