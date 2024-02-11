{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "sketchybar-app-font";
  version = "1.0.5";

  src = fetchurl {
    url = "https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v${version}/sketchybar-app-font.ttf";
    sha256 = "sha256-vb1L+8zQy3foeQnoAlHSf1erdN2xBGEUK8BSH9NJtcQ=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 $src $out/share/fonts/sketchybar-app-font/sketchybar-app-font.ttf

    runHook postInstall
  '';

  meta = {
    description = "A symbol font for sketchybar, initialized with the symbols from simple-bar";
    maintainers = with lib.maintainers; [];
    platforms = with lib.platforms; all;
    homepage = "https://github.com/kvndrsslr/sketchybar-app-font";
    license = lib.licenses.unlicense;
  };
}
