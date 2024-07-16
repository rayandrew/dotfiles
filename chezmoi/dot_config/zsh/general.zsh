export PATH="/etc/profiles/per-user/$USER/bin:/run/current-system/sw/bin/:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/opt/go/bin:$PATH"
export PATH="$HOME/opt/parallel/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# export EDITOR="nvim"
export EDITOR="emacs -nw"
export ZINIT_INSTALL_BINARY=0

{ eval `ssh-agent`; } &>/dev/null
