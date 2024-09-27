{
  config,
  lib,
  pkgs,
  ...
}: let
  swayosd-style = pkgs.writeText "swayosd-style.css" ''
    window {
      background: ${config.colors.catppuccin.mocha.rgba.crust 1.0};
      border: 2px solid ${config.colors.catppuccin.mocha.rgba.overlay0 1.0};
      border-radius: 30px;
    }

    window#osd {
      padding: 12px 20px;
      border-radius: 30px;
      border: 2px solid ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
      background: ${config.colors.catppuccin.mocha.rgba.crust 1.0};
    }

    #container {
      margin: 16px;
    }

    image,
    label {
      color: ${config.colors.catppuccin.mocha.rgba.text 1.0};
    }

    progressbar:disabled,
    image:disabled {
      opacity: 0.5;
    }

    progressbar {
      min-height: 6px;
      border-radius: 10px;
      background: transparent;
      border: none;
    }

    trough {
      min-height: inherit;
      border-radius: inherit;
      border: none;
      background: ${config.colors.catppuccin.mocha.rgba.surface0 1.0};
    }

    progress {
      min-height: inherit;
      border-radius: inherit;
      border: none;
      background: ${config.colors.catppuccin.mocha.rgba.text 1.0};
    }
  '';
in {
  config = lib.mkIf config.settings.desktop.hyprland.enable {
    services.swayosd = {
      stylePath = "${swayosd-style}";
    };
  };
}
