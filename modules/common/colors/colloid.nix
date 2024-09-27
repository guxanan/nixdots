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
    "red"
    "pink"
    "purple"
    "blue"
    "teal"
    "green"
    "yellow"
    "orange"

    "grey-050"
    "grey-100"
    "grey-150"
    "grey-200"
    "grey-250"
    "grey-300"
    "grey-350"
    "grey-400"
    "grey-450"
    "grey-500"
    "grey-550"
    "grey-600"
    "grey-650"
    "grey-700"
    "grey-750"
    "grey-800"
    "grey-850"
    "grey-900"
    "grey-950"

    "white"
    "black"

    "button-close"
    "button-max"
    "button-min"
    "links"
  ];
in {
  options.colors.colloid.nord = {
    dark = {
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

  config.colors.colloid.nord = {
    dark = {
      # HEX
      # Example usage: ${color "FF"}
      hex = {
        red = alpha: "#c35b65${toString alpha}";
        pink = alpha: "#cd7092${toString alpha}";
        purple = alpha: "#b57daa${toString alpha}";
        blue = alpha: "#5e81ac${toString alpha}";
        teal = alpha: "#63a6a5${toString alpha}";
        green = alpha: "#82ac5d${toString alpha}";
        yellow = alpha: "#e4b558${toString alpha}";
        orange = alpha: "#d08770${toString alpha}";

        grey-050 = alpha: "#f8fafc${toString alpha}";
        grey-100 = alpha: "#f0f1f4${toString alpha}";
        grey-150 = alpha: "#eaecf0${toString alpha}";
        grey-200 = alpha: "#d9dce3${toString alpha}";
        grey-250 = alpha: "#c4c9d4${toString alpha}";
        grey-300 = alpha: "#b5bcc9${toString alpha}";
        grey-350 = alpha: "#929cb0${toString alpha}";
        grey-400 = alpha: "#8e99ae${toString alpha}";
        grey-450 = alpha: "#74819a${toString alpha}";
        grey-500 = alpha: "#616d85${toString alpha}";
        grey-550 = alpha: "#464f62${toString alpha}";
        grey-600 = alpha: "#3a4150${toString alpha}";
        grey-650 = alpha: "#333a47${toString alpha}";
        grey-700 = alpha: "#242932${toString alpha}";
        grey-750 = alpha: "#1e222a${toString alpha}";
        grey-800 = alpha: "#1c1f26${toString alpha}";
        grey-850 = alpha: "#0f1115${toString alpha}";
        grey-900 = alpha: "#0d0e11${toString alpha}";
        grey-950 = alpha: "#020203${toString alpha}";

        white = alpha: "#ffffff${toString alpha}";
        black = alpha: "#000000${toString alpha}";

        button-close = alpha: "#bf616a${toString alpha}";
        button-max = alpha: "#a3be8c${toString alpha}";
        button-min = alpha: "#ebcb8b${toString alpha}";
        links = alpha: "#89b7c2${toString alpha}";
      };

      # RGBA
      # Example usage: ${color 1.0}
      rgba = {
        red = alpha: "rgba(195, 91, 101, ${toString alpha})";
        pink = alpha: "rgba(205, 112, 146, ${toString alpha})";
        purple = alpha: "rgba(181, 125, 170, ${toString alpha})";
        blue = alpha: "rgba(94, 129, 172, ${toString alpha})";
        teal = alpha: "rgba(99, 166, 165, ${toString alpha})";
        green = alpha: "rgba(130, 172, 93, ${toString alpha})";
        yellow = alpha: "rgba(228, 181, 88, ${toString alpha})";
        orange = alpha: "rgba(208, 135, 112, ${toString alpha})";

        grey-050 = alpha: "rgba(248, 250, 252, ${toString alpha})";
        grey-100 = alpha: "rgba(240, 241, 244, ${toString alpha})";
        grey-150 = alpha: "rgba(234, 236, 240, ${toString alpha})";
        grey-200 = alpha: "rgba(217, 220, 227, ${toString alpha})";
        grey-250 = alpha: "rgba(196, 201, 212, ${toString alpha})";
        grey-300 = alpha: "rgba(181, 188, 201, ${toString alpha})";
        grey-350 = alpha: "rgba(146, 156, 176, ${toString alpha})";
        grey-400 = alpha: "rgba(142, 153, 174, ${toString alpha})";
        grey-450 = alpha: "rgba(116, 129, 154, ${toString alpha})";
        grey-500 = alpha: "rgba(97, 109, 133, ${toString alpha})";

        grey-550 = alpha: "rgba(70, 79, 98, ${toString alpha})";
        grey-600 = alpha: "rgba(58, 65, 80, ${toString alpha})";
        grey-650 = alpha: "rgba(51, 58, 71, ${toString alpha})";
        grey-700 = alpha: "rgba(36, 41, 50, ${toString alpha})";
        grey-750 = alpha: "rgba(30, 34, 42, ${toString alpha})";
        grey-800 = alpha: "rgba(28, 31, 38, ${toString alpha})";
        grey-850 = alpha: "rgba(15, 17, 21, ${toString alpha})";
        grey-900 = alpha: "rgba(13, 14, 17, ${toString alpha})";
        grey-950 = alpha: "rgba(2, 2, 3, ${toString alpha})";

        white = alpha: "rgba(255, 255, 255, ${toString alpha})";
        black = alpha: "rgba(0, 0, 0, ${toString alpha})";

        button-close = alpha: "rgba(191, 97, 106, ${toString alpha})";
        button-max = alpha: "rgba(163, 190, 140, ${toString alpha})";
        button-min = alpha: "rgba(235, 203, 139, ${toString alpha})";
        links = alpha: "rgba(137, 183, 194, ${toString alpha})";
      };

      # HYPR
      # Example usage: ${color "FF"}
      hypr = {
        red = alpha: "rgba(c35b65${toString alpha})";
        pink = alpha: "rgba(cd7092${toString alpha})";
        purple = alpha: "rgba(b57daa${toString alpha})";
        blue = alpha: "rgba(5e81ac${toString alpha})";
        teal = alpha: "rgba(63a6a5${toString alpha})";
        green = alpha: "rgba(82ac5d${toString alpha})";
        yellow = alpha: "rgba(e4b558${toString alpha})";
        orange = alpha: "rgba(d08770${toString alpha})";

        grey-050 = alpha: "rgba(f8fafc${toString alpha})";
        grey-100 = alpha: "rgba(f0f1f4${toString alpha})";
        grey-150 = alpha: "rgba(eaecf0${toString alpha})";
        grey-200 = alpha: "rgba(d9dce3${toString alpha})";
        grey-250 = alpha: "rgba(c4c9d4${toString alpha})";
        grey-300 = alpha: "rgba(b5bcc9${toString alpha})";
        grey-350 = alpha: "rgba(929cb0${toString alpha})";
        grey-400 = alpha: "rgba(8e99ae${toString alpha})";
        grey-450 = alpha: "rgba(74819a${toString alpha})";
        grey-500 = alpha: "rgba(616d85${toString alpha})";
        grey-550 = alpha: "rgba(464f62${toString alpha})";
        grey-600 = alpha: "rgba(3a4150${toString alpha})";
        grey-650 = alpha: "rgba(333a47${toString alpha})";
        grey-700 = alpha: "rgba(242932${toString alpha})";
        grey-750 = alpha: "rgba(1e222a${toString alpha})";
        grey-800 = alpha: "rgba(1c1f26${toString alpha})";
        grey-850 = alpha: "rgba(0f1115${toString alpha})";
        grey-900 = alpha: "rgba(0d0e11${toString alpha})";
        grey-950 = alpha: "rgba(020203${toString alpha})";

        white = alpha: "rgba(ffffff${toString alpha})";
        black = alpha: "rgba(000000${toString alpha})";

        button-close = alpha: "rgba(bf616a${toString alpha})";
        button-max = alpha: "rgba(a3be8c${toString alpha})";
        button-min = alpha: "rgba(ebcb8b${toString alpha})";
        links = alpha: "rgba(89b7c2${toString alpha})";
      };
    };
  };
}
