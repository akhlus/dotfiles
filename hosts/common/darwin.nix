{
  pkgs,
  settings,
  ...
}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "${settings.name}";
    autoMigrate = true;
  };

  users.users.${settings.name} = {
    name = "${settings.name}";
    home = "/Users/${settings.name}";
  };

  homebrew = {
    enable = true;
    casks = [];
    onActivation.cleanup = "zap";
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        KeyRepeat = 2;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        PMPrintingExpandedStateForPrint = true;
      };
      dock = {
        autohide = true;
        expose-animation-duration = 0.15;
        show-recents = false;
        showhidden = true;
        persistent-apps = [
          "/Applications/Brave Browser.app"
        ];
        tilesize = 30;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      # swapLeftCtrlAndFn = true;
      # Remap §± to ~
      userKeyMapping = [
        {
          #HIDKeyboardModifierMappingDst = 30064771125;
          HIDKeyboardModifierMappingSrc = 30064771172;
        }
      ];
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.optimise.automatic = true;
  system.stateVersion = 6;
  nixpkgs.config.allowUnfree = true;
}
