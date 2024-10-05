{
  config,
  pkgs,
  ...
}: {
  settings = {
    desktop.hyprland.enable = true;
    hardware.gpu.amdgpu.enable = true;
  };
}
