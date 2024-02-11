{
  lib,
  stdenvNoCC,
  flake,
}:
stdenvNoCC.mkDerivation rec {
  pname = "sf-mono-liga-bin";
  version = "dev";
  src = flake.inputs.sf-mono-liga-src;
  dontConfigure = true;
  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp -R $src/*.otf $out/share/fonts/opentype/
  '';
}
