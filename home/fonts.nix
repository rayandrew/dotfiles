{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    sf-symbols
    sf-mono-liga
    recursive
    atkinson-hyperlegible
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "FiraMono"
        "Ubuntu"
        "UbuntuMono"
        "CascadiaCode"
        "Iosevka"
        "IosevkaTerm"
        "IntelOneMono"
        "JetBrainsMono"
        "Hack"
        "Go-Mono"
        "iA-Writer"
        "Meslo"
        "Inconsolata"
        "InconsolataGo"
        "InconsolataLGC"
      ];
    })
    sketchybar-app-font
    iosevka
    iosevka-comfy.comfy
    iosevka-comfy.comfy-wide
    iosevka-comfy.comfy-motion
    iosevka-comfy.comfy-wide-motion
    inconsolata
    meslo-lg
    fira
    fira-go
  ];
}
