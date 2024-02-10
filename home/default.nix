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
          flake.inputs.sops-nix.homeManagerModules.sops
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
        ];
      };
    };
  };
}
