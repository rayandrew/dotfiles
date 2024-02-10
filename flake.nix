{
  description = "Ray's Nix Configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Flake utils
    nixos-flake.url = "github:srid/nixos-flake";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-utils.url = "github:numtide/flake-utils";

    # Tools
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-darwin"];

      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.pre-commit-hooks.flakeModule
        inputs.nixos-flake.flakeModule
        ./config/users
        ./home
        ./nixos
        ./nix-darwin
      ];

      flake = {
        darwinConfigurations = {
          appreciate = self.nixos-flake.lib.mkMacosSystem {
            nixpkgs.hostPlatform = "aarch64-darwin";
            imports = [
              self.darwinModules.default # Defined in nix-darwin/default.nix
              ./systems/darwin.nix
            ];
          };
        };
      };

      perSystem = {
        self',
        system,
        pkgs,
        lib,
        config,
        inputs',
        ...
      }: {
        nixos-flake.primary-inputs = ["nixpkgs" "home-manager" "nix-darwin" "nixos-flake"];

        devShells.default = pkgs.mkShell {
          name = "nix-config";
          nativeBuildInputs = [
            config.treefmt.build.wrapper
          ];
          packages = [
            pkgs.sops
            pkgs.ssh-to-age
          ];
          DIRENV_LOG_FORMAT = "";
          shellHook = ''
            ${config.pre-commit.installationScript}
          '';
        };

        pre-commit = {
          settings.excludes = ["flake.lock"];
          settings.hooks = {
            treefmt.enable = true;
          };
        };

        treefmt.config = {
          projectRootFile = "flake.nix";
          programs.alejandra.enable = true;
        };

        formatter = config.treefmt.build.wrapper;
        packages.default = self'.packages.activate;

        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            (import ./packages {
              flake = self;
              inherit (pkgs) system;
            })
          ];
          config = {};
        };
      };
    };
}
