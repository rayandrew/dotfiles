{
  flake,
  system,
  ...
}: self: super: {
  nix-cleanup = super.callPackage ../packages/nix-cleanup {};
  nixos-cleanup = super.callPackage ../packages/nix-cleanup {isNixOS = true;};
}
