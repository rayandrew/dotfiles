# Ray Dotfiles

## Nix Config

Inspirations:

- <https://github.com/srid/nixos-config>
- <https://github.com/fufexan/dotfiles>
- <https://github.com/rayandrew/nix-config>

## Chezmoi

> Why Chezmoi? You have nix, home-manager, etc.

I really like using `nix`, but I've been thinking about a better way to handle my dotfiles, especially on systems that don't use `nix`.
I work with a lot of remote servers for my research and job, and most of these servers don't run on `nix`.

As I work with more files, like scripts for my research and projects I share with my colleagues, I've started to feel that sticking strictly to a `nix`-based system might not be the best approach.
There have been times when I've either written a new script or borrowed one, only to find it full of bugs. Fixing these bugs often requires a lot of messy workarounds and adjustments.
For instance, every time I need to test a script and tweak environment variables in my `zshrc` or `bashrc`, I have to rebuild my `nix` configurations.
While `nix-shell` offers a way to test these changes, it can be pretty inconvenient, especially with Python environments or dealing with old scripts my colleagues use.

The rebuilding process with `nix` can take anywhere from 5 to 10 seconds.
This delay is frustrating, especially when I need to quickly test a script multiple times.
The constant context switching caused by these delays often makes me lose track of what I was doing.

On top of all this, my main workstation is a MacBook, and I also use Ubuntu/Debian servers for GPU and high-performance computing tasks.
These systems inherently don't mesh well with `nix`'s pure environment approach.

That's why I've started looking for a more flexible way to manage my dotfiles.
Back then, I used `chezmoi` for managing my dotfiles and I really liked it.
However, I still wanted to use `nix` when possible, so combining them seemed like a good idea :)
