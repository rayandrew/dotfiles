{
  pkgs,
  config,
  lib,
  ...
}: let
  homeDir = config.home.homeDirectory;
  # stow = "${pkgs.stow}/bin/stow";
in {
  home.packages = with pkgs; [
    stow
  ];

  home.activation.stow = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # echo -e "\033[0;34mActivating stow"
    # echo -e "\033[0;34m=================="
    pushd ${homeDir}/Code/dotfiles/stow
    ${pkgs.stow}/bin/stow --verbose --target=${homeDir} --no-folding ssh
    ${pkgs.stow}/bin/stow --verbose --target=${homeDir} --no-folding scripts
    ${pkgs.stow}/bin/stow --verbose --target=${homeDir} --no-folding tmux
    popd
    # echo -e "\033[0;34m=================="
  '';
}
