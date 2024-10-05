{inputs, ...}: {
  imports = [
    inputs.aagl.nixosModules.default
  ];

  programs = {
    anime-game-launcher.enable = true;
    anime-games-launcher.enable = false;
    anime-borb-launcher.enable = false;
    honkers-railway-launcher.enable = false;
    honkers-launcher.enable = false;
    wavey-launcher.enable = false;
    sleepy-launcher.enable = true;
  };
}
