{
  inputs,
  outputs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    sharedModules = [../../../../home-manager/features];
    extraSpecialArgs = {inherit inputs outputs;};
  };
}
