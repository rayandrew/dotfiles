alias .. 'cd ..'
alias :q 'exit'
alias cat 'bat'
alias du 'dust'
alias eza 'eza '
alias g 'git status -sb'
alias ga 'git add'
alias gb 'git branch -v'
alias gba 'git for-each-ref --sort=committerdate refs/heads/ --format="%(authordate:short) %(color:red)%(objectname:short) '\'''\''%(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))"'
alias gbd 'git for-each-ref --sort=-committerdate refs/heads/ --format="%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset))"'
alias gc 'git commit'
alias gca 'git commit --amend'
alias gcheck 'git checkout'
alias gcm 'git commit -m'
alias gcod 'git checkout develop'
alias gcom 'git checkout main'
alias gcos 'git checkout staging'
alias gd 'git diff --color-words'
alias gf 'git fetch'
alias gfa 'git fetch --all'
alias gl 'git log --oneline --decorate'
alias gp 'git push'
alias gpl 'git pull --rebase'
alias gpod 'git push origin develop'
alias gpofl 'git push --force-with-lease origin'
alias gpom 'git push origin main'
alias gpos 'git push origin staging'
alias gprod 'git pull --rebase origin develop'
alias gprom 'git pull --rebase origin main'
alias gpros 'git pull --rebase origin staging'
alias gprud 'git pull --rebase upstream develop'
alias gprum 'git pull --rebase upstream main'
alias gprus 'git pull --rebase upstream staging'
alias gpud 'git push upstream develop'
alias gpufl 'git push --force-with-lease upstream'
alias gpum 'git push upstream main'
alias gpus 'git push upstream staging'
alias gr 'git rm'
alias gra 'git rebase --abort'
alias grc 'git rebase --continue'
alias grd 'git rebase develop'
alias gri 'git rebase -i'
alias grm 'git rebase main'
alias grs 'git rebase staging'
alias gsl 'git stash list'
alias gslog 'git log --graph --abbrev-commit --decorate --date=relative --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias gsp 'git stash pop'
alias gss 'git stash save'
alias gst 'git status -sb'
alias nxb 'nix build'
alias nxd 'nix develop'
alias nxf 'nix flake'
alias nxpu 'nix-prefetch-url --unpack'
alias nxr 'nix run'
alias nxs 'nix search'
alias tb 'toggle-background'

alias ls 'ls --color=auto'
alias l 'lla'
alias lla 'll -a'
alias llt 'll --tree'
alias la 'ls -a'
alias ll 'ls -l'
alias lt 'ls --tree'

if command -v eza > /dev/null
    alias ls 'eza'
    alias ll 'eza -l --time-style long-iso --icons'
    alias tree 'eza --tree'
end

if command -v lsd > /dev/null
    alias ls 'lsd'
    alias tree 'lsd --tree'
end

alias vim 'nvim'
alias e 'nvim'

alias cdot 'cd $HOME/Code/dotfiles/'
