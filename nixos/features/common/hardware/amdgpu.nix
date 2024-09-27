{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.hardware.gpu.amdgpu.enable {
    #boot.initrd.kernelModules = ["amdgpu"];
    #services.xserver.videoDrivers = ["amdgpu"];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = builtins.attrValues {
        inherit
          (pkgs)
          libva
          vaapiVdpau
          libvdpau-va-gl
          ;
      };

      extraPackages32 = builtins.attrValues {
        inherit
          (pkgs.pkgsi686Linux)
          vaapiVdpau
          libvdpau-va-gl
          ;
      };
    };
  };
}
