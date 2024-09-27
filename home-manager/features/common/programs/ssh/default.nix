{
  config,
  pkgs,
  ...
}: {
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "~/.ssh/known_hosts.d/hosts";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "${config.home.homeDirectory}/Resources/ssh/github/ssh_github_auth_ed25519_key";
        identitiesOnly = true;
      };
    };
  };
}
