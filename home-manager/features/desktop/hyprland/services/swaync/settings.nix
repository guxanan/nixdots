{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.swaync.settings = {
      positionX = "center";
      positionY = "top";
      control-center-positionX = "right";
      control-center-positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 5;
      control-center-margin-bottom = 5;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = true;
      notification-icon-size = 50;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      hide-on-action = true;
      image-visibility = "when available";

      widgets = [
        "buttons-grid"
        "volume"
        "backlight"
        "mpris"
        "title"
        "dnd"
        "notifications"
      ];

      widget-config = {
        buttons-grid = {
          actions = [
            {
              "label" = "󰖩";
              "command" = "zsh -c 'swaync-client -t -sw && kitty --class nmtui -e nmtui'";
            }
            {
              "label" = "󰂯";
              "command" = "zsh -c 'swaync-client -t -sw && blueman-manager'";
            }
            {
              "label" = "󰕾";
              "command" = "zsh -c 'swaync-client -t -sw && ${lib.getExe pkgs.pavucontrol}'";
            }
            {
              "label" = "󱎔";
              "command" = "zsh -c 'swaync-client -t -sw && ${lib.getExe pkgs.qpwgraph}'";
            }
            {
              "label" = "󱓥";
              "command" = "zsh -c 'swaync-client -t -sw && rofi-clipboard'";
            }
            {
              "label" = "󰐥";
              "command" = "zsh -c 'swaync-client -t -sw && ${lib.getExe pkgs.wlogout} -b 2'";
            }
          ];
        };

        volume = {
          label = "󰕾";
          show-per-app = true;
          show-per-app-label = true;
        };

        backlight = {
          label = "󰃟";
        };

        mpris = {
          image-size = 60;
          image-radius = 10;
        };

        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "󰎟";
        };

        dnd = {
          text = "Do Not Disturb";
        };
      };
    };
  };
}
