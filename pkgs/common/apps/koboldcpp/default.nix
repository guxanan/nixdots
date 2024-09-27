{
  stdenv,
  fetchFromGitHub,
  buildEnv,
  customtkinter,
  python3Packages,
  clblast,
  openblas,
  ocl-icd,
  vulkan-headers,
  vulkan-loader,
}: let
  # Python dependencies
  pythonEnv = python3Packages.python.withPackages (_:
    builtins.attrValues {
      inherit
        (python3Packages)
        numpy
        sentencepiece
        customtkinter
        ;
    });
in
  stdenv.mkDerivation rec {
    pname = "koboldcpp";
    version = "1.61.2";
    src = fetchFromGitHub {
      owner = "LostRuins";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-l6XWbstBAl5BQrwrQxLuPX5uKp02hED6vGQQVhZAO9U=";
    };

    # Setting the Makefile's ROCM_PATH to the previously created bundle
    env = {
      GPU_TARGETS = "gfx803";
    };

    # LLVM is actually needed for amdgpu-arch
    # Also, without ocl-icd it fails to run properly for me
    buildInputs = [
      clblast
      openblas
      ocl-icd
      vulkan-headers
      vulkan-loader
    ];

    # Python things usually belong in propagatedBuildInputs
    propagatedBuildInputs = [
      pythonEnv
    ];

    # Fixing the paths from the Makefile
    postUnpack = ''
      substituteInPlace $sourceRoot/Makefile \
       --replace "/llvm/bin/" "/bin/"
    '';

    # Specifying that I want to build all the options, execept for CUBLAS since I'm using AMD
    makeFlags = [
      #"LLAMA_OPENBLAS=1"
      "LLAMA_CLBLAST=1"
      #"LLAMA_HIPBLAS=1"
      "LLAMA_VULKAN=1"
    ];

    # Since by default it only compiles the libraries but doesn't install anywhere we'll do it manually
    installPhase = ''
      # Making the necessary directories
      mkdir -p "$out/share/koboldcpp" "$out/share/icons/koboldcpp" "$out/bin" "$out/share/applications"

      # Moving the important files to the /share/koboldcpp folder
      find . \( -name "*.py" -o -name "*.so" -o -name "*.csv" -o -name "*.sh" -o -name "*.ini" -o -name "*.cmd" -o -name "*.md" -o -name "*.bat" -o -name "*.embd" \) -exec sh -c '
        for file do
          mkdir -p "$out/share/koboldcpp/$(dirname "$file")"
          cp "$file" "$out/share/koboldcpp/$file"
        done' sh {} +

      # Moving the icon to an appropriate place
      cp nikogreen.ico $out/share/icons/koboldcpp/nikogreen.ico

      # Making an executable in bin for easy access in the terminal
      cat > $out/bin/koboldcpp <<EOF
        #!/usr/bin/env bash
        cd ~/LLMs
        $out/share/koboldcpp/koboldcpp.py "\$@"
      EOF

      # Making it executable
      chmod +x $out/bin/koboldcpp
      chmod +x $out/share/koboldcpp/koboldcpp.py

      # Making a desktop entry so you can launch it with whatever launcher you use
      cat > $out/share/applications/koboldcpp.desktop <<EOF
        [Desktop Entry]
        Name=KoboldCPP
        GenericName=Large language models that run locally on your GPU or CPU
        Comment=Run LLM's on your machine.
        Exec=kitty -e koboldcpp
        Icon=$out/share/icons/koboldcpp/nikogreen.ico
        Type=Application
        Categories=Utility;Office;
        Keywords=GPT,Chat;AI
      EOF
    '';
  }
