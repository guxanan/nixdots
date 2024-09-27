{
  config,
  lib,
  inputs,
  outputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
    ];
    config.allowUnfree = true;
  };
}
