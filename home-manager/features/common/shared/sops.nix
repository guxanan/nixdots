{
  config,
  lib,
  inputs,
  outputs,
  ...
}: {
  imports = [inputs.sops-nix.homeManagerModules.sops];

  sops = {
    age.sshKeyPaths = ["/home/guxanan/Resources/ssh/host/ssh_host_ed25519_key"];
    defaultSopsFile = "${inputs.secrets}/common.yaml";
  };
}
