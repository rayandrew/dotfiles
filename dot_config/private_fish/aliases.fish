alias d pu
alias e 'emacs -nw'

if type -q exa
    alias la '/usr/bin/env -S exa -a'
    alias ll '/usr/bin/env -S exa -l'
    alias lla '/usr/bin/env -S exa -la'
    alias ls '/usr/bin/env -S exa'
    alias lt '/usr/bin/env -S exa --tree'
end

if type -q htop
    alias top '/usr/bin/env htop'
end

if type -q paru
    alias pac '/usr/bin/env paru'
end

if type -q bat
    alias cat '/usr/bin/env bat'
end

if type -q pnpm
    alias np pnpm
end

if type -q nvim
    alias vim nvim
end

if type -q taskwarrior-tui
    alias tt taskwarrior-tui
end

# git
source "$XDG_CONFIG_HOME/fish/aliases/git.fish"
