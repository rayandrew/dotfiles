{
  lib,
  stdenvNoCC,
  fetchurl,
  undmg,
  xar,
  cpio,
  fonts ? true,
  full ? false,
  app ? false,
}:
stdenvNoCC.mkDerivation rec {
  pname = "sf-symbols";
  version = "4";

  src = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-${version}.dmg";
    sha256 = "1jy85rfbw8hq4rjx01x4rhpr7rqibqr7arl2zw7cl25kgv76d6s7";
  };

  sourceRoot = ".";
  buildInputs = [undmg xar cpio];
  installPhase =
    ''
      xar -Oxf SF\ Symbols.pkg SFSymbols.pkg/Payload | gzip -d | cpio -i
    ''
    + lib.optionalString fonts ''
      mkdir -p $out/share/fonts/truetype
      cp ./Library/Fonts/${
        if full
        then "*"
        else "SF-Pro.ttf"
      } $out/share/fonts/truetype
    ''
    + lib.optionalString app ''
      mkdir -p $out/Applications
      cp -R ./Applications/SF\ Symbols.app $out/Applications
    '';

  meta = {
    description =
      if app
      then "Tool that provides consistent, highly configurable symbols for apps"
      else "Fonts from SF Symbols";
    homepage = "https://developer.apple.com/sf-symbols/";
    platforms =
      if app
      then lib.platforms.darwin
      else lib.platforms.all;
  };
}
