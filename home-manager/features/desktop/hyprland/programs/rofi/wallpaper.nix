{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  rofi-wallpaper-theme = pkgs.writeText "rofi-wallpaper-theme" ''
    /* ---- Imports ---- */
    @import "${config.xdg.configHome}/rofi/config.rasi"

    /* ---- Configuration ---- */
    configuration {
        modi:                        "drun";
    }

    /* ---- Window ---- */
    window {
        // Default
        enabled:                     true;
        fullscreen:                  false;
        transparency:                "real";
        cursor:                      "default";
        spacing:                     0px;
        border:                      2px;
        border-radius:               15px;
        location:                    center;
        anchor:                      center;

        // Style Values
        width:                       75%;
        background-color:            ${config.colors.catppuccin.mocha.rgba.crust 1.0};
    }

    /* ---- Mainbox ---- */
    mainbox {
        enabled:                     true;
        children:                    [ "listview" ];
        background-color:            transparent;
    }

    /* ---- List ---- */
    listview {
        enabled:                     true;
        columns:                     4;
        lines:                       2;
        padding:                     26px 36px;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        flow:                        horizontal;
        fixed-height:                true;
        fixed-columns:               true;

        background-color:            transparent;
        spacing:                     20px;

        //  Adapt rofi theme
        border:                      0px;

    }

    /* ---- Elements ---- */
    element {
        enabled:                     true;
        orientation:                 vertical;
        expand:                      false;
        spacing:                     0px;
        padding:                     5px 10px;
        border-radius:               10px;
        cursor:                      pointer;
        background-color:            transparent;
    }


    element normal.normal {
        background-color:            inherit;
        text-color:                  inherit;
    }

    element normal.urgent {
        background-color:            ${config.colors.catppuccin.mocha.rgba.base 1.0};
        text-color:                  ${config.colors.catppuccin.mocha.rgba.text 1.0};
    }

    element normal.active {
        background-color:            ${config.colors.catppuccin.mocha.rgba.base 1.0};
        text-color:                  ${config.colors.catppuccin.mocha.rgba.text 1.0};
    }

    element selected.normal {
        background-color:            ${config.colors.catppuccin.mocha.rgba.base 1.0};
        text-color:                  ${config.colors.catppuccin.mocha.rgba.text 1.0};
    }

    // Adapt rofi theme
    element alternate.normal {
        background-color:            transparent;
        text-color:                  inherit;
    }

    element alternate.urgent {
        background-color:            transparent;
        text-color:                  inherit;
    }

    element alternate.active {
        background-color:            transparent;
        text-color:                  inherit;
    }

    /* ---- Image Box ---- */
    element-icon {
        size:                        30%;
        cursor:                      inherit;
        expand:                      false;
        padding:                     0px;
        background-color:            inherit;
    }

    element-text {
        vertical-align:              0.5;
        horizontal-align:            0.5;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  ${config.colors.catppuccin.mocha.rgba.text 1.0};
    }

    // Adapt rofi theme
    element.alternate.normal {
        background-color:            inherit;
        text-color:                  inherit;
    }
  '';

  rofi-wallpaper = pkgs.writeShellApplication {
    name = "rofi-wallpaper";
    runtimeInputs = builtins.attrValues {
      inherit
        (pkgs)
        swww
        reload
        ;
    };
    text = ''
      # WALLPAPERS PATH
      wallDIR="${config.home.homeDirectory}/Wallpapers"

      # Transition config
      FPS=60
      TYPE="grow"
      DURATION=2
      SWWW_PARAMS=(--transition-fps "$FPS" --transition-type "$TYPE" --transition-duration "$DURATION")

      # Retrieve image files
      PICS=()
      for file in "''${wallDIR}"/*.jpg "''${wallDIR}"/*.jpeg "''${wallDIR}"/*.png "''${wallDIR}"/*.gif; do
          if [ -f "$file" ]; then
              PICS+=("$(basename "$file")")
          fi
      done

      # Rofi command
      rofi_command="rofi -show -dmenu -theme ${rofi-wallpaper-theme}"

      menu() {
          for i in "''${!PICS[@]}"; do
              # Displaying .gif to indicate animated images
              if ! echo "''${PICS[$i]}" | grep -q '.gif$'; then
                  icon_name=$(basename "''${PICS[$i]}" .gif)
                  printf "%s\x00icon\x1f%s/%s\n" "$icon_name" "$wallDIR" "''${PICS[$i]}"
              else
                  printf "%s\n" "''${PICS[$i]}\n"
              fi
          done
      }

      main() {
          choice=$(menu | ''${rofi_command})

          # No choice case
          if [[ -z $choice ]]; then
              exit 0
          fi

          # Find the index of the selected file
          pic_index=-1
          for i in "''${!PICS[@]}"; do
              filename=$(basename "''${PICS[$i]}")
              if [[ "$filename" == "$choice"* ]]; then
                  pic_index=$i
                  break
              fi
          done

          if [[ $pic_index -ne -1 ]]; then
              swww img "''${wallDIR}/''${PICS[$pic_index]}" "''${SWWW_PARAMS[@]}"
              #matugen image "''${wallDIR}/''${PICS[$pic_index]}"
              #wallust run "''${wallDIR}/''${PICS[$pic_index]}"
              cp --reflink=always "''${wallDIR}/''${PICS[$pic_index]}" "$HOME/.config/background"
              reload
          else
              echo "Image not found."
              exit 1
          fi
      }

      # Check if rofi is already running
      if pidof rofi > /dev/null; then
          pkill rofi
          exit 0
      fi

      main
    '';
  };
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    home.packages = [rofi-wallpaper];
  };
}
