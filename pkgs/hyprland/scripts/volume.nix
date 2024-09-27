{
  pkgs,
  writeShellApplication,
}:
writeShellApplication {
  name = "volume";
  runtimeInputs = builtins.attrValues {
    inherit
      (pkgs)
      libnotify
      ;
  };
  text = ''
    volume_status=$(volume-check | awk '{print int($2*100)}')
    muted=$(mute-check)

    case $1 in
      up)
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        volume_status=$(volume-check | awk '{print int($2*100)}')
        muted=$(mute-check)
        ;;
      down)
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-
        volume_status=$(volume-check | awk '{print int($2*100)}')
        muted=$(mute-check)
        ;;
      mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        volume_status=$(volume-check | awk '{print int($2*100)}')
        muted=$(mute-check)
        ;;
    esac

    if [ "$muted" = true ]; then
      message="󰝟  Muted"
    else
      case $volume_status in
        0)
          message="󰖁  Volume: $volume_status%"
          ;;
        [1-9]|1[0-9]|2[0-9]|3[0-4])
          message="󰕿  Volume: $volume_status%"
          ;;
        3[5-9]|4[0-9]|5[0-9]|6[0-9])
          message="󰖀  Volume: $volume_status%"
          ;;
        *)
          message="󰕾  Volume: $volume_status%"
          ;;
      esac
    fi


    notify-send "$message" \
      -h int:value:"$volume_status" \
      --replace-id="$(cat "/tmp/notification" 2>/dev/null || echo 0)" --print-id > "/tmp/notification.tmp" && mv "/tmp/notification.tmp" "/tmp/notification"
  '';
}
