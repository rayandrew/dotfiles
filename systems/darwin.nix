{
  pkgs,
  flake,
  ...
}:
# See nix-darwin/default.nix for other modules in use.
{
  environment.systemPackages = with pkgs; [
  ];

  security.pam.enableSudoTouchIdAuth = true;

  # For home-manager to work.
  users.users.${flake.config.people.myself} = {
    name = flake.config.people.myself;
    home = "/Users/${flake.config.people.myself}";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.defaults = {
    CustomUserPreferences = {
      NSGlobalDomain = {
        WebKitDeveloperExtras = true;
        # AppleHighlightColor = "0.65098 0.85490 0.58431";
        # AppleAccentColor = 1;
      };
      "com.apple.finder" = {
        DisableAllAnimations = true;
        ShowExternalHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        ShowHardDrivesOnDesktop = false;
      };
      "com.apple.NetworkBrowser" = {
        BrowseAllInterfaces = 1;
      };
      "com.apple.DesktopServices" = {
        DSDontWriteNetworkStores = true;
      };
      "com.apple.Safari" = {
        AutoOpenSafeDownloads = false;
        IncludeDevelopMenu = true;
        WebKitDeveloperExtrasEnabledPreferenceKey = true;
        "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
      };
      "com.apple.mail" = {
        AddressesIncludeNameOnPasteboard = false;
      };
      "net.sourceforge.skim-app.skim" = {
        SKPSConversionCommand = "${pkgs.ps2pdfcrop}/bin/ps2pdfcrop";
      };
    };
    screencapture = {
      disable-shadow = true;
      location = "/Users/${flake.config.people.myself}/Screenshots";
      type = "png";
    };
    trackpad = {
      Clicking = true;
      Dragging = true;
      TrackpadRightClick = true;
      # TrackpadThreeFingerDrag = true;
    };
    dock = {
      autohide = true;
      expose-animation-duration = 0.0;
      mineffect = "scale";
      minimize-to-application = true;
      mru-spaces = false;
      orientation = "bottom";
      show-recents = false;
      wvous-br-corner = 1; # Disabled
    };
    finder = {
      AppleShowAllExtensions = true;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      AppleShowAllFiles = true;
      _FXShowPosixPathInTitle = true;
      ShowStatusBar = false;
    };

    NSGlobalDomain = {
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleShowAllExtensions = true;
      AppleTemperatureUnit = "Celsius";
      # AppleInterfaceStyle = "Dark";
      AppleInterfaceStyle = null; # -- light mode
      AppleInterfaceStyleSwitchesAutomatically = false;
      InitialKeyRepeat = 20;
      KeyRepeat = 2;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDisableAutomaticTermination = true;
      NSAutomaticWindowAnimationsEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSTableViewDefaultSizeMode = 2;
      NSWindowResizeTime = 1.0e-4;
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
    };
    LaunchServices.LSQuarantine = false;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
