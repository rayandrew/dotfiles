{
  pkgs,
  config,
  lib,
  ...
}: let
  homeDir = config.home.homeDirectory;
in {
  home.packages = with pkgs; [
    chezmoi
  ];

  # home.activation.chezmoi = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   # echo -e "\033[0;34mActivating chezmoi"
  #   # echo -e "\033[0;34m=================="
  #   ${pkgs.chezmoi}/bin/chezmoi apply -S ${homeDir}/Code/dotfiles/chezmoi --verbose
  #   # echo -e "\033[0;34m=================="
  # '';
}
