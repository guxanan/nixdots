{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  rofi-launcher-theme = pkgs.writeText "rofi-launcher-theme" ''
    /* ---- Imports ---- */
    @import "${config.xdg.configHome}/rofi/config.rasi"

    /*****----- Main Window -----*****/
    window {
        /* properties for window widget */
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       1000px;
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
        orientation:                 horizontal;
        children:                    [ "imagebox", "listbox" ];
    }

    imagebox {
        padding:                     20px;
        background-color:            transparent;
        background-image:            url("~/.config/background", height);
        orientation:                 vertical;
        children:                    [ "inputbar", "dummy", "mode-switcher" ];
    }

    listbox {
        spacing:                     20px;
        padding:                     20px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "message", "listview" ];
    }

    dummy {
        background-color:            transparent;
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        padding:                     15px;
        border-radius:               10px;
        background-color:            @selected-color;
        text-color:                  @text-color;
        children:                    [ "textbox-prompt-colon", "entry" ];
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "";
        background-color:            inherit;
        text-color:                  inherit;
    }

    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Search";
        placeholder-color:           inherit;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     20px;
        background-color:            transparent;
        text-color:                  @text-color;
    }

    button {
        padding:                     15px;
        border-radius:               10px;
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
        lines:                       8;
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
        spacing:                     15px;
        padding:                     8px;
        border-radius:               10px;
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
        padding:                     15px;
        border-radius:               10px;
        background-color:            @selected-color;
        text-color:                  @text-color;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    error-message {
        padding:                     15px;
        border-radius:               20px;
        background-color:            @selected-color;
        text-color:                  @text-color;
    }
  '';

  rofi-launcher = pkgs.writeShellApplication {
    name = "rofi-launcher";
    text = ''
      rofi -show drun -theme ${rofi-launcher-theme}
    '';
  };
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    home.packages = [rofi-launcher];
  };
}
