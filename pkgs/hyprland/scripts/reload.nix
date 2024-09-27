{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "reload";
  text = ''
    hyprctl reload &
    pkill -SIGUSR2 waybar &
    pkill -SIGUSR2 swayosd-server &
    swaync-client --reload-css &
  '';
}
