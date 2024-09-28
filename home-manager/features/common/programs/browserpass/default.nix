{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.browserpass = {
    enable = true;
  };
}
