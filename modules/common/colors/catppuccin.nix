{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    types
    mkOption
    ;

  colornames = [
    "rosewater"
    "flamingo"
    "pink"
    "mauve"
    "red"
    "maroon"
    "peach"
    "yellow"
    "green"
    "teal"
    "sky"
    "sapphire"
    "blue"
    "lavender"

    "text"
    "subtext1"
    "subtext0"
    "overlay2"
    "overlay1"
    "overlay0"
    "surface2"
    "surface1"
    "surface0"
    "base"
    "mantle"
    "crust"
  ];
in {
  options.colors.catppuccin = {
    mocha = {
      hex = builtins.listToAttrs (map
        (c: {
          name = c;
          value = mkOption {type = types.anything;};
        })
        colornames);

      hypr = builtins.listToAttrs (map
        (c: {
          name = c;
          value = mkOption {type = types.anything;};
        })
        colornames);

      rgba = builtins.listToAttrs (map
        (c: {
          name = c;
          value = mkOption {type = types.anything;};
        })
        colornames);
    };
  };

  config.colors.catppuccin = {
    mocha = {
      # HEX
      # Example usage: ${color "FF"}
      hex = {
        rosewater = alpha: "#f5e0dc${toString alpha}";
        flamingo = alpha: "#f2cdcd${toString alpha}";
        pink = alpha: "#f5c2e7${toString alpha}";
        mauve = alpha: "#cba6f7${toString alpha}";
        red = alpha: "#f38ba8${toString alpha}";
        maroon = alpha: "#eba0ac${toString alpha}";
        peach = alpha: "#fab387${toString alpha}";
        yellow = alpha: "#f9e2af${toString alpha}";
        green = alpha: "#a6e3a1${toString alpha}";
        teal = alpha: "#94e2d5${toString alpha}";
        sky = alpha: "#89dceb${toString alpha}";
        sapphire = alpha: "#74c7ec${toString alpha}";
        blue = alpha: "#89b4fa${toString alpha}";
        lavender = alpha: "#b4befe${toString alpha}";

        text = alpha: "#cdd6f4${toString alpha}";
        subtext1 = alpha: "#bac2de${toString alpha}";
        subtext0 = alpha: "#a6adc8${toString alpha}";
        overlay2 = alpha: "#9399b2${toString alpha}";
        overlay1 = alpha: "#7f849c${toString alpha}";
        overlay0 = alpha: "#6c7086${toString alpha}";
        surface2 = alpha: "#585b70${toString alpha}";
        surface1 = alpha: "#45475a${toString alpha}";
        surface0 = alpha: "#313244${toString alpha}";
        base = alpha: "#1e1e2e${toString alpha}";
        mantle = alpha: "#181825${toString alpha}";
        crust = alpha: "#11111b${toString alpha}";
      };

      # HYPR
      # Example usage: ${color "FF"}
      hypr = {
        rosewater = alpha: "rgba(f5e0dc${toString alpha})";
        flamingo = alpha: "rgba(f2cdcd${toString alpha})";
        pink = alpha: "rgba(f5c2e7${toString alpha})";
        mauve = alpha: "rgba(cba6f7${toString alpha})";
        red = alpha: "rgba(f38ba8${toString alpha})";
        maroon = alpha: "rgba(eba0ac${toString alpha})";
        peach = alpha: "rgba(fab387${toString alpha})";
        yellow = alpha: "rgba(f9e2af${toString alpha})";
        green = alpha: "rgba(a6e3a1${toString alpha})";
        teal = alpha: "rgba(94e2d5${toString alpha})";
        sky = alpha: "rgba(89dceb${toString alpha})";
        sapphire = alpha: "rgba(74c7ec${toString alpha})";
        blue = alpha: "rgba(89b4fa${toString alpha})";
        lavender = alpha: "rgba(b4befe${toString alpha})";

        text = alpha: "rgba(cdd6f4${toString alpha})";
        subtext1 = alpha: "rgba(bac2de${toString alpha})";
        subtext0 = alpha: "rgba(a6adc8${toString alpha})";
        overlay2 = alpha: "rgba(9399b2${toString alpha})";
        overlay1 = alpha: "rgba(7f849c${toString alpha})";
        overlay0 = alpha: "rgba(6c7086${toString alpha})";
        surface2 = alpha: "rgba(585b70${toString alpha})";
        surface1 = alpha: "rgba(45475a${toString alpha})";
        surface0 = alpha: "rgba(313244${toString alpha})";
        base = alpha: "rgba(1e1e2e${toString alpha})";
        mantle = alpha: "rgba(181825${toString alpha})";
        crust = alpha: "rgba(11111b${toString alpha})";
      };

      # RGBA
      # Example usage: ${color 1.0}
      rgba = {
        rosewater = alpha: "rgba(245, 224, 220, ${toString alpha})";
        flamingo = alpha: "rgba(242, 205, 205, ${toString alpha})";
        pink = alpha: "rgba(245, 194, 231, ${toString alpha})";
        mauve = alpha: "rgba(203, 166, 247, ${toString alpha})";
        red = alpha: "rgba(243, 139, 168, ${toString alpha})";
        maroon = alpha: "rgba(235, 160, 172, ${toString alpha})";
        peach = alpha: "rgba(250, 179, 135, ${toString alpha})";
        yellow = alpha: "rgba(249, 226, 175, ${toString alpha})";
        green = alpha: "rgba(166, 227, 161, ${toString alpha})";
        teal = alpha: "rgba(148, 226, 213, ${toString alpha})";
        sky = alpha: "rgba(137, 220, 235, ${toString alpha})";
        sapphire = alpha: "rgba(116, 199, 236, ${toString alpha})";
        blue = alpha: "rgba(137, 180, 250, ${toString alpha})";
        lavender = alpha: "rgba(180, 190, 254, ${toString alpha})";

        text = alpha: "rgba(205, 214, 244, ${toString alpha})";
        subtext1 = alpha: "rgba(186, 194, 222, ${toString alpha})";
        subtext0 = alpha: "rgba(166, 173, 200, ${toString alpha})";
        overlay2 = alpha: "rgba(147, 153, 178, ${toString alpha})";
        overlay1 = alpha: "rgba(127, 132, 156, ${toString alpha})";
        overlay0 = alpha: "rgba(108, 112, 134, ${toString alpha})";
        surface2 = alpha: "rgba(88, 91, 112, ${toString alpha})";
        surface1 = alpha: "rgba(69, 71, 90, ${toString alpha})";
        surface0 = alpha: "rgba(49, 50, 68, ${toString alpha})";
        base = alpha: "rgba(30, 30, 46, ${toString alpha})";
        mantle = alpha: "rgba(24, 24, 37, ${toString alpha})";
        crust = alpha: "rgba(17, 17, 27, ${toString alpha})";
      };
    };
  };
}
