set -U fish_greeting

function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo "$XDG_CONFIG_HOME/fish/functions/fisher.fish"
    fish -c fisher install jorgebucaran/fisher
end

source "$HOME/.config/fish/general.fish"
source "$HOME/.config/fish/paths.fish"
source "$HOME/.config/fish/aliases.fish"
source "$HOME/.config/fish/personal.fish"

if status is-interactive
    # show directory listing on directory change
    function __ls_after_cd__on_variable_pwd --on-variable PWD
        ls -la
    end

    if type -q direnv
        direnv hook fish | source
    end
end
