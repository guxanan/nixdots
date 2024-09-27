{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.waybar.style = ''
      /* -----------------------------------------------------
      * General
      * ----------------------------------------------------- */

      /*@import '${config.xdg.configHome}/matugen/results/colors-waybar.css';*/

      * {
          font-family: ${config.settings.fontSettings.sansSerif.family}, JetBrainsMono Nerd Font Propo, NotoSansMono Nerd Font;
          font-size: 14px;
          font-weight: ${config.settings.fontSettings.sansSerif.weight};
          min-height: 0;
      }

      /* -----------------------------------------------------
      * General - Waybar
      * ----------------------------------------------------- */

      window#waybar {
          background-color: ${config.colors.catppuccin.mocha.rgba.crust 1.0};
          transition-property: background-color;
          transition-duration: 0.5s;
      }

      /* -----------------------------------------------------
      * General - Buttons
      * ----------------------------------------------------- */

      button:hover {
          color: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
      }

      /* -----------------------------------------------------
      * General - Modules
      * ----------------------------------------------------- */

      .modules-left,
      .modules-center,
      .modules-right {
          color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
      }

      /* -----------------------------------------------------
      * Tooltip
      * ----------------------------------------------------- */

      tooltip {
          border-radius: 10px;
          background: ${config.colors.catppuccin.mocha.rgba.base 1.0};
      }

      tooltip label {
          padding: 2px 2px 2px 2px;
      }

      /* -----------------------------------------------------
      * Modules - Left
      * ----------------------------------------------------- */

      #custom-launcher {
          color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
          margin: 0px 10px 0px 10px;
      }

      #workspaces {
          border-radius: 20px;
          padding: 0px 4px;
          font-weight: bold;
      }

      #workspaces button {
          color: transparent;
          background-color: ${config.colors.catppuccin.mocha.rgba.overlay0 1.0};
          margin: 6px 2px;
          padding: 0px 4px;
          border-radius: 20px;
          transition: all 0.2s ease-in-out;
      }

      #workspaces button.empty {
          color: transparent;
          background-color: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
          transition: all 0.2s ease-in-out;
      }

      #workspaces button.active {
          color: transparent;
          background-color: ${config.colors.catppuccin.mocha.rgba.red 0.7};
          min-width: 60px;
          transition: all 0.2s ease-in-out;
      }

      #workspaces button:hover,
      #workspaces button.empty:hover,
      #workspaces button.active:hover {
          color: transparent;
          background-color: ${config.colors.catppuccin.mocha.rgba.overlay0 0.7};
          transition: all 0.2s ease-in-out;
      }

      /* -----------------------------------------------------
      * Modules - Center
      * ----------------------------------------------------- */

      #clock {
          color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
          border-radius: 20px;
          padding: 0px 10px 0px 10px;
      }

      #clock:hover {
          background-color: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
      }

      /* -----------------------------------------------------
      * Modules - Right
      * ----------------------------------------------------- */

      #tray {
          background-color: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
          border-radius: 20px;
          padding: 0px 10px 0px 10px;
          color: red;
          margin: 0px 5px 0px 5px;
      }

      #tray:hover {
          color: red;
          background-color: ${config.colors.catppuccin.mocha.rgba.surface2 1.0};
      }

      #tray menu {
          background-color: ${config.colors.catppuccin.mocha.rgba.base 1.0};
          border: 1px solid ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
          border-radius: 15px;
          padding: 6px 6px;
      }

      #tray menu menuitem:hover {
          background-color: ${config.colors.catppuccin.mocha.rgba.base 1.0};
          color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
      }

      #custom-launcher,
      #power-profiles-daemon,
      #temperature.gpu,
      #temperature.cpu,
      #language,
      #network,
      #pulseaudio,
      #custom-notification {
        color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
        border-radius: 20px;
        padding: 0px 10px 0px 10px;
        margin: 0px 4px 0px 4px;
      }

      #custom-launcher:hover,
      #power-profiles-daemon:hover,
      #temperature.gpu:hover,
      #temperature.cpu:hover,
      #language:hover,
      #network:hover,
      #pulseaudio:hover,
      #custom-notification:hover {
        background-color: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
      }
    '';
  };
}
