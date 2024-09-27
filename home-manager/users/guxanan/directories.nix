{
  config,
  pkgs,
  ...
}: {
  xdg.userDirs.extraConfig = {
    XDG_GAMES_DIR = "${config.home.homeDirectory}/Games";
    XDG_LEARNING_DIR = "${config.home.homeDirectory}/Learning";
    XDG_LLMs_DIR = "${config.home.homeDirectory}/LLMs";
    XDG_NixOS_DIR = "${config.home.homeDirectory}/NixOS";
    XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
    XDG_RESOURCES_DIR = "${config.home.homeDirectory}/Resources";
    XDG_TOOLS_DIR = "${config.home.homeDirectory}/Tools";
    XDG_WALLPAPERS_DIR = "${config.home.homeDirectory}/Wallpapers";
  };
}
