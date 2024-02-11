{
  pkgs,
  lib,
  config,
  ...
}: let
  homeDir = config.home.homeDirectory;
in {
  home.packages = with pkgs;
    [
      ripgrep
      fd
      sd
      ncdu
      moreutils # ts, etc.
      eza
      coreutils-full
      gnugrep
      gawk

      # Useful for Nix development
      nil
      nixpkgs-fmt
      alejandra

      # Publishing
      asciinema

      # Dev
      gh
    ]
    ++ lib.optionals stdenv.isDarwin [
      # macOS-specific tools
      nix-cleanup
    ]
    ++ lib.optionals stdenv.isLinux [
      # Linux-specific tools
      nixos-cleanup
    ];

  home.shellAliases = {
    e = "nvim";
    g = "git";
    lg = "lazygit";
    drb = "darwin-rebuild build --flake ${homeDir}/Code/dotfiles";
    drs = "darwin-rebuild switch --flake ${homeDir}/Code/dotfiles";
    flakeup = "nix flake update ${homeDir}/Code/dotfiles";
  };

  programs = {
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    nix-index-database.comma.enable = true;
    lsd.enable = true;
    bat.enable = true;
    autojump.enable = false;
    zoxide.enable = true;
    fzf.enable = true;
    jq.enable = true;
    htop.enable = true;
    rio.enable = true;
  };
}
