{
  self,
  flake,
  inputs,
  ...
}: {
  flake = {
    homeModules = {
      common = {
        home.stateVersion = "23.11";
        imports = [
          inputs.sops-nix.homeManagerModules.sops
          inputs.nix-index-database.hmModules.nix-index
          ./chezmoi.nix
          ./terminal.nix
          ./neovim.nix
          ./emacs.nix
          ./git.nix
          ./tmux.nix
          ./zsh.nix
          ./fish.nix
          ./direnv.nix
          ./fonts.nix
          ./stow.nix
          ./zellij.nix
        ];
      };
      common-graphics = {
        imports = [
          ./kitty.nix
          ./vscode.nix
          ./wezterm.nix
          ./discord.nix
        ];
      };
      common-linux = {
        imports = [
          self.homeModules.common
          ({pkgs, ...}: {
            home.packages = with pkgs; [
              nixos-cleanup
            ];
          })
        ];
      };
      common-linux-graphics = {
        imports = [
          self.homeModules.common
          self.homeModules.common-graphics
        ];
      };
      common-darwin = {
        imports = [
          self.homeModules.common
          self.homeModules.common-graphics
          ({
            pkgs,
            config,
            lib,
            ...
          }: {
            home.packages = with pkgs; [
              iterm2
              nix-cleanup
              colima
              lima
            ];

            disabledModules = ["targets/darwin/linkapps.nix"];
            home.activation = {
              copyApplications = let
                apps = pkgs.buildEnv {
                  name = "home-manager-applications";
                  paths = config.home.packages;
                  pathsToLink = "/Applications";
                };
              in
                lib.hm.dag.entryAfter ["writeBoundary"] ''
                  baseDir="$HOME/Applications/Home Manager Apps"
                  if [ -d "$baseDir" ]; then
                    rm -rf "$baseDir"
                  fi
                  mkdir -p "$baseDir"
                  # for appFile in "${apps}/Applications/Home Manager Apps/*"; do
                  for appFile in ${apps}/Applications/*; do
                    baseAppFile=$(basename "$appFile")
                    _baseDir="$baseDir"
                    if [ "$baseAppFile" = "1Password.app" ]; then
                      _baseDir="/Applications"
                    fi
                    target="$_baseDir/$baseAppFile"
                    $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$_baseDir"
                    $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
                  done
                '';
            };
          })
        ];
      };
    };
  };
}
