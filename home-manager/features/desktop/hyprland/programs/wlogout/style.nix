{
  config,
  lib,
  pkgs,
  ...
}: let
  icons = "${config.home.homeDirectory}/Resources/wlogout";
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    programs.wlogout.style = ''
      * {
        background-image: none;
        transition: 20ms;
        box-shadow: none;
        font-family: ${config.settings.fontSettings.monospace.family};
        font-weight: bold;
        font-size: 20px;
      }

      window {
        background-color: ${config.colors.catppuccin.mocha.rgba.crust 0.3};
      }

      button {
        color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
        background-color: ${config.colors.catppuccin.mocha.rgba.base 1.0};
        border: transparent;
        margin: 10px;
        border-radius: 10px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
      }

      button:hover {
        background-color: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
        color: inherit;
        outline-style: none;
        background-size: 25%;
      }

      button:hover#lock {
          border-radius: 30px 30px 0px 30px;
          margin : 60px 5px 5px 430px;
          transition: all 0.2s ease-in-out;
      }

      button:hover#logout {
          border-radius: 30px 0px 30px 30px;
          margin : 5px 5px 60px 430px;
          transition: all 0.2s ease-in-out;
      }

      button:hover#shutdown {
          border-radius: 30px 30px 30px 0px;
          margin : 60px 430px 5px 5px;
          transition: all 0.2s ease-in-out;
      }

      button:hover#reboot {
          border-radius: 0px 30px 30px 30px;
          margin: 5px 430px 60px 5px;
          transition: all 0.2s ease-in-out;
      }

      #lock {
        background-image: image(url("${icons}/lock.png"));
        border-radius: 20px 0px 0px 0px;
        margin: 80px 5px 5px 450px;
        transition: all 0.2s ease-in-out;
      }

      #logout {
        background-image: image(url("${icons}/logout.png"));
        border-radius: 0px 0px 0px 20px;
        margin : 5px 5px 80px 450px;
        transition: all 0.2s ease-in-out;
      }

      #shutdown {
        background-image: image(url("${icons}/shutdown.png"));
        border-radius: 0px 20px 0px 0px;
        margin : 80px 450px 5px 5px;
        transition: all 0.2s ease-in-out;
      }

      #reboot {
        background-image: image(url("${icons}/reboot.png"));
        border-radius: 0px 0px 20px 0px;
        margin : 5px 450px 80px 5px;
        transition: all 0.2s ease-in-out;
      }
    '';
  };
}
