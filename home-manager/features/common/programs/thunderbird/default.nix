{
  config,
  lib,
  ...
}: {
  imports = [
    ./settings.nix
  ];

  programs.thunderbird = {
    enable = true;
    profiles = {
      "${config.home.username}.thunderbird" = {
        isDefault = true;
      };
    };
  };
}
