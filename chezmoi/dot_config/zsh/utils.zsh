export CC=clang

### CD will ls

# https://github.com/zshzoo/cd-ls/blob/main/cd-ls.zsh
if ! (( $chpwd_functions[(I)chpwd_cdls] )); then
  chpwd_functions+=(chpwd_cdls)
fi
function chpwd_cdls() {
  if [[ -o interactive ]]; then
    emulate -L zsh
    eza -la --time-style long-iso --icons
  fi
}

### FZF
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS="--bind tab:down,shift-tab:up,ctrl-space:select,ctrl-\\\:deselect -m"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --height 100%"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200' --height 100%"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --height 100%"

zle     -N            fzf-cd-widget
bindkey -M emacs '^X' fzf-cd-widget
bindkey -M vicmd '^X' fzf-cd-widget
bindkey -M viins '^x' fzf-cd-widget

### TMUX

# tmux() {
#   if [[ -n "$TMUX" ]]; then
#     command tmux "$@"
#   else
#     command tmux new-session -A -s main "$@"
#   fi
# }

### Herd (PHP)

if [[ `uname` == "Darwin" ]]; then
  # Herd injected PHP binary.
  export PATH="/Users/rayandrew/Library/Application Support/Herd/bin/":$PATH

  # Herd injected PHP 8.2 configuration.
  export HERD_PHP_82_INI_SCAN_DIR="/Users/rayandrew/Library/Application Support/Herd/config/php/82/"

  # export LDFLAGS="-L/opt/homebrew/opt/libiconv/lib $LDFLAGS"
  # export CFLAGS="-I/opt/homebrew/opt/libiconv/include $FLAGS"
  # export CPPFLAGS="-I/opt/homebrew/opt/libiconv/include $CPPFLAGS"
fi

### KITTY

if test -n "$KITTY_INSTALLATION_DIR"; then
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi
