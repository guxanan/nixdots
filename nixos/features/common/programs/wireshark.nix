{
  config,
  lib,
  pkgs,
  ...
}: {
  # Wireshark configuration.
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark-qt;
  };
}
