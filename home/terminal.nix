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
      gnumake
      gnupg
      gnused
      gnutar
      curl
      gawk
      tree
      watch
      wget
      jq
      just
      xdg-utils
      nushell
      fish
      cmake
      xz

      # Useful for Nix development
      nil
      nixpkgs-fmt
      alejandra

      # Publishing
      asciinema
      ghostscript
      ps2pdfcrop
      pandoc
      texlive.combined.scheme-full

      # Dev
      gh
      subversion
      deno
      ollama

      # Tools
      _1password
      poppler_utils
      imagemagick
      rclone
      gnuplot
    ]
    ++ lib.optionals stdenv.isDarwin [
      # macOS-specific tools
    ]
    ++ lib.optionals stdenv.isLinux [
      # Linux-specific tools
    ];

  home.shellAliases = {
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
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };
    micro = {
      enable = true;
    };
  };
}
