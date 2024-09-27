{
  buildPythonPackage,
  fetchFromGitHub,
  python3Packages,
}:
buildPythonPackage rec {
  pname = "customtkinter";
  version = "5.2.1";
  format = "pyproject";
  src = fetchFromGitHub {
    owner = "TomSchimansky";
    repo = "CustomTkinter";
    rev = "41f4aae01a54e7be569a313b5df5bbc561c597da";
    hash = "sha256-DK64LNxn/IkGK+jcguDcQdFw5mu7OY7NIbWEFwhFp3o=";
  };

  nativeBuildInputs = builtins.attrValues {
    inherit
      (python3Packages)
      setuptools
      wheel
      ;
  };

  propagatedBuildInputs = builtins.attrValues {
    inherit
      (python3Packages)
      tkinter
      darkdetect
      typing-extensions
      packaging
      ;
  };

  postInstall = ''
    mkdir -p "$out/share/fonts"
    cp -r customtkinter/assets/fonts/*.otf "$out/share/fonts"
    cp -r customtkinter/assets/fonts/Roboto/*.ttf "$out/share/fonts"
  '';

  postPatch = ''
    # We don't need it to write to home
    substituteInPlace customtkinter/windows/widgets/font/font_manager.py \
      --replace '~/.fonts/' $out/share/fonts/

    # It'll try to copy stuff and failing because it's read-only, so we're deleting this
    sed -i '58d' customtkinter/windows/widgets/font/font_manager.py

    # We don't need it to fall back to the other rendering
    substituteInPlace customtkinter/windows/widgets/font/__init__.py \
    --replace 'if FontManager.load_font(os.path.join(customtkinter_directory, "assets", "fonts", "CustomTkinter_shapes_font.otf")) is False:' 'FontManager.load_font(os.path.join(customtkinter_directory, "assets", "fonts", "CustomTkinter_shapes_font.otf"))'

    # We're just deleting everything down from here
    sed -i '19,$d' customtkinter/windows/widgets/font/__init__.py
  '';
}
