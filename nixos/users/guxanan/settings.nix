{
  config,
  pkgs,
  ...
}: {
  settings = {
    desktop.plasma.enable = true;
    hardware.gpu.amdgpu.enable = true;
  };
}
