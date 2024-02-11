{pkgs, ...}: {
  homebrew = {
    enable = true;
    onActivation = {
      # autoUpdate = true;
      cleanup = "zap";
    };
    global = {brewfile = true;};

    taps = [
      # "homebrew/cask"
      # "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      # "homebrew/core"
      "homebrew/services"
      "nrlquaker/createzap"
      "d12frosted/emacs-plus"
    ];

    # Prefer installing application from the Mac App Store
    masApps = {
      "1Password for Safari" = 1569813296;
      "Dark Reader for Safari" = 1438243180;
      "Amphetamine" = 937984704;
      "Color Picker" = 1545870783;
      "Spf - Screen Polarizer" = 1463398888;
    };

    # If an app isn't available in the Mac App Store, or the version in the App Store has
    # limitations, e.g., Transmit, install the Homebrew Cask.
    casks = [
      # "1password"
      # "1password-cli"
      "raycast"
      "skype"
      "vlc"
      "spotify"
      "alt-tab"
      "forklift" # sftp client
      "zoom"
      "pdf-expert"
      "slack"
      "multipass"
      "zotero"
      "nextcloud"
      "eloston-chromium" # ungoogled chromium
      "nordvpn"
      "whatsapp"
      "flux" # changing temperature of screen
      "neovide"
      # i need to install firefox from homebrew to make it works
      # with 1password. 1password requires app to be used inside
      # /Applications and Nix will install app in ~/Applications
      "firefox"
      "inkscape"
    ];

    # For cli packages that aren't currently available for macOS in `nixpkgs`
    brews = ["libiconv" "libomp" "php"];
  };
}
