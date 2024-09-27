{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    types
    mkOption
    mkForce
    mkDefault
    mkEnableOption
    ;
in {
  options.settings.hardware.gpu = {
    amdgpu.enable = mkOption {
      type = types.bool;
      default = false;
    };

    nvidia.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
