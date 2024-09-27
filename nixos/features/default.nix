{inputs, ...}: {
  imports = [
    inputs.self.outputs.commonModules
    ./common
    ./desktop
  ];
}
