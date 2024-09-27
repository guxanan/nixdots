{inputs, ...}: {
  imports = [
    inputs.self.outputs.commonModules
    inputs.self.outputs.homeManagerModules
    ./common
    ./desktop
  ];
}
