{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "screenshot";
  runtimeInputs = builtins.attrValues {
    inherit
      (pkgs)
      grimblast
      ;
  };
  text = ''
    case $1 in
      active)  grimblast --notify copysave active
          ;;

      area)  grimblast --notify copysave area
          ;;

      screen)  grimblast --notify copysave screen
          ;;
    esac
  '';
}
