{
  bash,
  nix,
  resholve,
  ghostscript,
  substituteAll,
  isNixOS ? false,
}:
resholve.mkDerivation rec {
  pname = "ps2pdfcrop";

  version = "0.0.1";

  src = substituteAll {
    src = ./ps2pdfcrop.sh;
    ps2pdf = "${ghostscript}/bin/ps2pdf";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 "$src" "$out/bin/${pname}"

    runHook postInstall
  '';

  solutions = {
    ps2pdfcrop = {
      scripts = ["bin/${pname}"];
      interpreter = "${bash}/bin/bash";
      inputs = [ghostscript];
      keep = {
        "$PS2PDF" = true;
      };
      fake = {
        external = [
          # https://github.com/abathur/resholve/issues/29
        ];
      };
      execer = [
        "cannot:${nix}/bin/nix-store"
        "cannot:${nix}/bin/nix-collect-garbage"
      ];
    };
  };
}
