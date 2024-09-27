{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  rofi-clipboard-theme = pkgs.writeText "rofi-clipboard-theme" ''
    /* ---- Imports ---- */
    @import "${config.xdg.configHome}/rofi/config.rasi"

    /*****----- Configuration -----*****/
    configuration {
        modi:                          "drun,filebrowser,window";
        display-drun:                  "";
        display-run:                   "";
        display-filebrowser:           "";
        display-window:                "";
    }

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       600px;
        x-offset:                    0px;
        y-offset:                    0px;

        /* properties for all widgets */
        enabled:                     true;
        border-color:                @border-color;
        border:                      2px solid;
        border-radius:               20px;
        cursor:                      "default";
        background-color:            @background-color;
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     0px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "inputbar", "listbox" ];
    }

    listbox {
        spacing:                     20px;
        padding:                     20px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "message", "listview" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        padding:                     80px 60px;
        background-color:            transparent;
        background-image:            url("~/.config/background", width);
        text-color:                  @text-color;
        orientation:                 horizontal;
        children:                    [ "textbox-prompt-colon", "entry", "dummy", "mode-switcher" ];
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "";
        padding:                     12px 15px;
        border-radius:               100%;
        background-color:            @selected-color;
        text-color:                  inherit;
    }

    entry {
        enabled:                     true;
        expand:                      false;
        width:                       250px;
        padding:                     12px 16px;
        border-radius:               100%;
        background-color:            @selected-color;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Search";
        placeholder-color:           inherit;
    }

    dummy {
        expand:                      true;
        background-color:            transparent;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     10px;
        background-color:            transparent;
        text-color:                  @text-color;
    }

    button {
        width:                       45px;
        padding:                     12px;
        border-radius:               100%;
        background-color:            @background-color;
        text-color:                  inherit;
        cursor:                      pointer;
    }

    button selected {
        background-color:            @selected-color;
        text-color:                  @text-color;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       7;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     10px;
        background-color:            transparent;
        text-color:                  @text-color;
        cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     10px;
        padding:                     4px;
        border-radius:               100%;
        background-color:            transparent;
        text-color:                  @text-color;
        cursor:                      pointer;
    }

    element normal.normal {
        background-color:            inherit;
        text-color:                  inherit;
    }

    element normal.urgent {
        background-color:            ${config.colors.catppuccin.mocha.rgba.base 1.0};
        text-color:                  @text-color;
    }

    element normal.active {
        background-color:            ${config.colors.catppuccin.mocha.rgba.base 1.0};
        text-color:                  @text-color;
    }

    element selected.normal {
        background-color:            ${config.colors.catppuccin.mocha.rgba.base 1.0};
        text-color:                  @text-color;
    }

    element selected.urgent {
        background-color:            ${config.colors.catppuccin.mocha.rgba.base 1.0};
        text-color:                  @text-color;
    }

    element selected.active {
        background-color:            ${config.colors.catppuccin.mocha.rgba.red 1.0};
        text-color:                  @background-color;
    }

    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        32px;
        cursor:                      inherit;
    }

    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    /*****----- Message -----*****/
    message {
        background-color:            transparent;
    }

    textbox {
        padding:                     12px;
        border-radius:               100%;
        background-color:            @background-color;
        text-color:                  @text-color;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    error-message {
        padding:                     12px;
        border-radius:               20px;
        background-color:            @background-color;
        text-color:                  @text-color;
    }
  '';

  rofi-clipboard = pkgs.writeShellApplication {
    name = "rofi-clipboard";
    runtimeInputs = builtins.attrValues {
      inherit
        (pkgs)
        wl-clipboard
        ;
    };
    text = ''
      while true; do
          # Present a menu to the user
          choice=$(echo -e "Copy\nDelete\nWipe\nExit" | rofi -dmenu -theme ${rofi-clipboard-theme} -p "Select Mode:")

          case $choice in
              Copy)
                  entries=$(cliphist list)
                  if [ -z "$entries" ]; then
                      echo "Exit" | rofi -dmenu -theme ${rofi-clipboard-theme} -p "Clipboard is Empty."
                      break
                  else
                      echo "$entries" | rofi -dmenu -theme ${rofi-clipboard-theme} -p "Copy from Clipboard." | cliphist decode | wl-copy
                      break
                  fi
                  ;;
              Delete)
                  while true; do
                      entries=$(cliphist list)
                      if [ -z "$entries" ]; then
                          echo "Exit" | rofi -dmenu -theme ${rofi-clipboard-theme} -p "Clipboard is Empty."
                          exit 1
                      else
                          echo "$entries" | rofi -dmenu -theme ${rofi-clipboard-theme} -p "Delete from Clipboard." | cliphist delete
                      fi
                  done
                  ;;
              Wipe)
                  if [ "$(echo -e "Clear\nCancel" | rofi -dmenu -theme ${rofi-clipboard-theme} -p "Wipe the Clipboard.")" == "Clear" ]; then
                      cliphist wipe
                      break
                  fi
                  ;;
              Exit)
                  break
                  ;;
              *)
                  echo "Invalid choice"
                  ;;
          esac
      done
    '';
  };
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    home.packages = [rofi-clipboard];
  };
}
