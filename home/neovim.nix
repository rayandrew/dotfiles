{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    package = pkgs.neovim-nightly;
    extraLuaPackages = ps: [ps.magick];
  };
}
