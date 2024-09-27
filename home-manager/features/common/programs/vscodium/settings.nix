{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.vscode.userSettings = {
    "editor.formatOnSave" = true;
    "extensions.autoUpdate" = false;
    "rust-analyzer.hover.actions.debug.enable" = false;
    "rust-analyzer.lens.debug.enable" = false;
    "rust-analyzer.hover.actions.run.enable" = false;
    "rust-analyzer.lens.run.enable" = false;
    "explorer.confirmDelete" = false;
    "update.showReleaseNotes" = false;
    "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace, 'FiraCode Nerd Font'";
  };
}
