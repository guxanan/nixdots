{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./realtime.nix
    ./sshAgentAuth.nix
  ];

  # rtkit is optional but recommended for Pipewire
  # RealtimeKit system service, which hands out realtime scheduling priority to user processes on demand
  security.rtkit.enable = true;
}
