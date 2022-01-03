set -q OPT_HOME; or set OPT_HOME "$HOME/opt"
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME "$HOME/.config"

if status is-interactive
    if not functions -q fisher
        curl https://git.io/fisher --create-dirs -sLo "$XDG_CONFIG_HOME/fish/functions/fisher.fish"
        fish -c fisher install jorgebucaran/fisher
    end

    if type -q starship
      starship init fish | source 
    end

    # aliases
    source "$XDG_CONFIG_HOME/fish/aliases.fish"

    # for gpg
    set -gx GPG_TTY (tty)

    # editor
    set -gx EDITOR "emacs -nw"

    fish_add_path "$HOME/bin"

    # Doom Emacs
    fish_add_path "$HOME/.emacs.d/bin"

    # MPICH
    if test -d /opt/mpich
        set -gx PATH /opt/mpich/bin $PATH
        set -gx MANPATH /opt/mpich/share/man $MANPATH
        set -gx PKG_CONFIG_PATH /opt/mpich/lib/pkgconfig $PKG_CONFIG_PATH
        set -gx LD_LIBRARY_PATH /opt/mpich/lib $LD_LIBRARY_PATH
        set -gx C_INCLUDE_PATH /opt/mpich/include $C_INCLUDE_PATH
    end


    if test -d "$HOME/perl5"
        set -gx PATH "$HOME/perl5/bin" $PATH
        set -q PERL5LIB; and set -x PERL5LIB "$HOME/perl5/lib/perl5":$PERL5LIB
        set -q PERL5LIB; or set -x PERL5LIB "$HOME/perl5/lib/perl5"
        set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT "$HOME/perl5":$PERL_LOCAL_LIB_ROOT
        set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT "$HOME/perl5"
        set -x PERL_MB_OPT --install_base\ \"$HOME/perl5\"
        set -x PERL_MM_OPT INSTALL_BASE="$HOME/perl5"
    end


    # Research Path
    if test -e "$HOME/research/research-path.fish"
        source "$HOME/research/research-path.fish"
    end

    # ASDF Package
    if test -e "$HOME/opt/asdf/asdf.fish"
        source "$HOME/opt/asdf/asdf.fish"
    end

    # Spack
    if test -e "$HOME/opt/spack/share/spack/setup-env.fish"
        source "$HOME/opt/spack/share/spack/setup-env.fish"
    end

    # Rust
    if test -d "$HOME/.cargo/bin"
        set -x PATH "$HOME/.cargo/bin" $PATH 2>/dev/null
    end

    # Pyenv
    if test -d "$HOME/opt/pyenv"
        set -Ux PYENV_ROOT "$HOME/opt/pyenv"
        fish_add_path "$PYENV_ROOT/bin"
        status is-login; and pyenv init --path | source
        status is-interactive; and pyenv init - | source
    end

    # 1Password
    # eval (op signin my)
end
