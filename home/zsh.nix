{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    envExtra = ''
      export PATH=/etc/profiles/per-user/$USER/bin:/run/current-system/sw/bin/:/usr/local/bin:$PATH
      if [ -f $HOME/.config/op/op.sh ]; then
        source $HOME/.config/op/op.sh
      fi
      # export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
    '';

    initExtraFirst = ''
      if [ -f $HOME/.config/zsh/zshrc ]; then
        source $HOME/.config/zsh/zshrc
      fi
    '';
  };
}
