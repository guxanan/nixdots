{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Gheorghiu Alin-Adrian";
    userEmail = "anghu.adrian@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      user.signing.key = "F6E0D06EB9487BF6AC569468DD8144A1FAB743ED";
      commit.gpgSign = true;
      gpg.program = "${config.programs.gpg.package}/bin/gpg2";
      merge.conflictStyle = "zdiff3";
      commit.verbose = true;
      diff.algorithm = "histogram";
      log.date = "iso";
      column.ui = "auto";
      branch.sort = "committerdate";
      # Automatically track remote branch
      push.autoSetupRemote = true;
      # Reuse merge conflict fixes when rebasing
      rerere.enabled = true;
    };

    lfs.enable = true;

    ignores = [
      ".direnv"
      "result"
      ".jj"
    ];
  };
}
