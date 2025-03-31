{
  settings,
  specialArgs,
  pkgs,
  ...
}: {
  imports = [];

  networking.hostName = settings.hostname;
  users.users.${settings.name} = {
    name = "${settings.name}";
    home = "/Users/${settings.name}";
  };

  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    users.${settings.name}.imports = [
      #specialArgs.inputs.mac-app-util.homeManagerModules.default
      ../${settings.type}/${settings.type}-home.nix
    ];
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "${settings.name}";
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    casks = [
      "anki"
      #"autodesk-fusion"
      "bambu-studio"
      #"calibre"
      #"kicad"
      "ghostty"
      "xournal++"
    ];
    masApps = {
      "Bitwarden" = 1352778147;
    };
    onActivation.cleanup = "zap";
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        PMPrintingExpandedStateForPrint = true;
        _HIHideMenuBar = true;
        "com.apple.trackpad.forceClick" = false;
      };
      WindowManager = {
        AppWindowGroupingBehavior = false;
        AutoHide = true;
        EnableStandardClickToShowDesktop = false;
        EnableTiledWindowMargins = false;
        EnableTilingByEdgeDrag = true;
        GloballyEnabled = false;
        HideDesktop = true;
        StageManagerHideWidgets = true;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };
      controlcenter = {
        BatteryShowPercentage = true;
        Sound = false;
        NowPlaying = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        expose-animation-duration = 0.15;
        largesize = 16;
        launchanim = false;
        magnification = false;
        mineffect = "scale";
        minimize-to-application = true;
        persistent-apps = [
          {app = "${pkgs.brave}/Applications/Brave Browser.app";}
          {app = "${pkgs.zed-editor}/Applications/Zed.app";}
          {app = "/Applications/Ghostty.app";}
          {app = "${pkgs.spotify}/Applications/Spotify.app";}
          {app = "/System/Applications/System Settings.app";}
        ];
        show-process-indicators = true;
        show-recents = false;
        showhidden = true;
        tilesize = 34;
      };
      finder = {
        AppleShowAllFiles = true;
        CreateDesktop = false;
        NewWindowTarget = "Home";
        ShowExternalHardDrivesOnDesktop = false;
        ShowHardDrivesOnDesktop = false;
        ShowPathbar = true;
        ShowRemovableMediaOnDesktop = false;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  environment.variables = {
    FLAKE_PATH = "${settings.flakePath}";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.optimise.automatic = true;
  system.stateVersion = 6;
  nixpkgs.config.allowUnfree = true;
}
