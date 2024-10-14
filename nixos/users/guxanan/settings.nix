{
  config,
  pkgs,
  ...
}: {
  settings = {
    desktop.gnome.enable = true;
    hardware.gpu.amdgpu.enable = true;
  };
}
