{pkgs, ...}: {
  home.packages = with pkgs; [
    chezmoi
  ];
}
