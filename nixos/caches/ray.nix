{
  nix.settings.trusted-public-keys = [
    "rayandrew.cachix.org-1:kJnvdWgUyErPGaQWgh/yyu91szgRYD+V/WQ4Dbc4n9M="
    "rayandrew-nix-config.cachix.org-1:on0ZZRm+vpJW+D4vv5NxHamNRIRwjQovpckETxz7MYs="
  ];
  nix.settings.substituters = [
    "https://rayandrew.cachix.org"
    "https://rayandrew-nix-config.cachix.org"
  ];
}
