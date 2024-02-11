{
  flake,
  system,
  ...
}: final: prev: {
  nix-cleanup = prev.callPackage ./nix-cleanup {};
  nixos-cleanup = prev.callPackage ./nix-cleanup {isNixOS = true;};
  nix-whereis = prev.callPackage ./nix-whereis {};

  # fonts
  sf-symbols = final.sf-symbols-minimal;
  sf-symbols-app = prev.callPackage ./sf-symbols {
    app = true;
    fonts = false;
  };
  sf-symbols-full =
    prev.callPackage ./sf-symbols {full = true;};
  sf-symbols-minimal = prev.callPackage ./sf-symbols {};
  sf-mono-liga = prev.callPackage ./sf-mono-liga {inherit flake;};
  sketchybar-app-font = prev.callPackage ./sketchybar-app-font {};
}
