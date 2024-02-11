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
          ./git.nix
          ./tmux.nix
          ./zsh.nix
          ./direnv.nix
        ];
      };
      common-graphics = {
        imports = [
          ./kitty.nix
        ];
      };
      common-linux = {
        imports = [
          self.homeModules.common
        ];
      };
      common-darwin = {
        imports = [
          self.homeModules.common
          self.homeModules.common-graphics
        ];
      };
    };
  };
}
