{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.waybar.settings = {
      mainBar = {
        position = "top";
        layer = "bottom";
        height = 32;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "power-profiles-daemon"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "temperature#gpu"
          "temperature#cpu"
          "hyprland/language"
          "network"
          "pulseaudio"
          "custom/notification"
        ];

        /*
        ****----- Modules Left -----****
        */

        "custom/launcher" = {
          "format" = "";
          "on-click" = "sleep 0.1 && rofi-launcher";
          "on-scroll-up" = "hyprctl dispatch workspace -1";
          "on-scroll-down" = "hyprctl dispatch workspace +1";
          "tooltip" = false;
        };

        "hyprland/workspaces" = {
          "persistent-workspaces" = {
            "*" = 10;
          };
          "disable-scroll" = false;
          "on-scroll-up" = "hyprctl dispatch workspace -1";
          "on-scroll-down" = "hyprctl dispatch workspace +1";
          "format" = "{id}";
          "on-click" = "activate";
        };

        "power-profiles-daemon" = {
          "format" = "{icon}";
          "tooltip-format" = "Power Profile: {icon}";
          "tooltip" = true;
          "format-icons" = {
            "default" = "󰾅";
            "performance" = "󰓅 Performance";
            "balanced" = "󰾅 Balanced";
            "power-saver" = "󰾆 Power-Saver";
          };
        };

        /*
        ****----- Modules Center -----****
        */

        "clock" = {
          "format" = " {:%b %d  %H:%M}";
          "timezone" = "Europe/Rome";
          "locale" = "it_IT.UTF-8";
          "tooltip-format" = "<tt><big>{calendar}</big></tt>";
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
            "actions" = {
              "on-click-right" = "mode";
              "on-click-forward" = "tz_up";
              "on-click-backward" = "tz_down";
              "on-scroll-up" = "shift_up";
              "on-scroll-down" = "shift_down";
            };
          };
        };

        /*
        ****----- Modules Right -----****
        */

        "tray" = {
          "icon-size" = 14;
          "spacing" = 20;
        };

        "temperature#gpu" = {
          "hwmon-path-abs" = "/sys/devices/pci0000:00/0000:00:03.1/0000:07:00.0/hwmon";
          "interval" = 5;
          "input-filename" = "temp1_input";
          "format" = " {temperatureC}°C";
          "tooltip" = true;
          "tooltip-format" = "GPU Temperature: {temperatureC}°C";
        };

        "temperature#cpu" = {
          "hwmon-path-abs" = "/sys/devices/pci0000:00/0000:00:18.3/hwmon";
          "interval" = 5;
          "input-filename" = "temp3_input";
          "format" = " {temperatureC}°C";
          "tooltip" = true;
          "tooltip-format" = "CPU Temperature: {temperatureC}°C";
        };

        "hyprland/language" = {
          "format" = " {}";
          "on-click" = "hyprctl switchxkblayout sonix-usb-device next";
          "on-click-right" = "hyprctl switchxkblayout sonix-usb-device prev";
          "keyboard-name" = "sonix-usb-device";
        };

        "network" = {
          "interval" = 5;
          "format-wifi" = "󰤢 {signalStrength}%";
          "format-ethernet" = "󰈀";
          "format-disconnected" = "󰤭";
          "tooltip-format" = "Network: {ifname} - {ipaddr}/{cidr}";
          "on-click-right" = "kitty --class nmtui -e nmtui";
        };

        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "<span size=\"large\">󰝟</span>";
          "format-icons" = {
            "default" = [
              "<span size=\"large\">󰝟</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰖀</span>"
              "<span size=\"large\">󰕾</span>"
              "<span size=\"large\">󰕾</span>"
              "<span size=\"large\">󰕾</span>"
            ];
          };
          "on-click" = "swayosd-client --output-volume mute-toggle && ${lib.getExe pkgs.volume-ux}";
          "on-scroll-up" = "swayosd-client --output-volume raise && ${lib.getExe pkgs.volume-ux}";
          "on-scroll-down" = "swayosd-client --output-volume lower && ${lib.getExe pkgs.volume-ux}";
          "scroll-step" = 5;
          "on-click-right" = "${lib.getExe pkgs.pavucontrol}";
          "tooltip" = true;
          "tooltip-format" = "Volume: {volume}%";
        };

        "custom/powermenu" = {
          "format" = "⏻";
          "on-click" = "sleep 0.1 && ${lib.getExe pkgs.wlogout} -b 2";
          "tooltip" = false;
        };

        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "<span size='large'>󰜗</span><span foreground='red'><sup></sup></span>";
            "none" = "<span size='large'>󰜗</span>";
            "dnd-notification" = "<span size='large'>󱓣</span><span foreground='red'><sup></sup></span>";
            "dnd-none" = "<span size='large'>󱓣</span>";
            "inhibited-notification" = "<span size='large'>󰜗</span><span foreground='red'><sup></sup></span>";
            "inhibited-none" = "<span size='large'>󰜗</span>";
            "dnd-inhibited-notification" = "<span size='large'>󱓣</span><span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "<span size='large'>󱓣</span>";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };
      };
    };
  };
}
