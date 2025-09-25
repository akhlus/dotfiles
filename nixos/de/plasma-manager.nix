{username, ...}: {
  programs = let
    mkFont = family: size: {
      inherit family;
      pointSize = size;
    };
  in {
    okular = {
      enable = true;
      general = {
        openFileInTabs = true;
        smoothScrolling = true;
        zoomMode = "fitWidth";
      };
    };
    plasma = {
      enable = true;
      configFile = {"kdeglobals"."KDE"."AnimationDurationFactor" = 0;};
      fonts = {
        fixedWidth = mkFont "Lilex Nerd Font Mono" 12;
        general = mkFont "IBM Plex Sans" 12;
        menu = mkFont "IBM Plex Sans" 12;
        small = mkFont "IBM Plex Sans" 9;
        toolbar = mkFont "IBM Plex Sans" 12;
        windowTitle = mkFont "IBM Plex Sans" 12;
      };
      input.keyboard.options = ["caps:esc"];
      krunner = {
        position = "center";
        shortcuts.launch = "Meta+Space";
      };
      kwin = {
        effects = {
          blur = {
            enable = true;
            noiseStrength = 5;
            strength = 10;
          };
          desktopSwitching = {
            animation = "off";
            navigationWrapping = false;
          };
          minimization.animation = "off";
          shakeCursor.enable = true;
          translucency.enable = true;
          windowOpenClose.animation = "off";
        };
        nightlight.enable = false;
        titlebarButtons = {
          left = ["minimize" "maximize" "close"];
          right = [];
        };
        virtualDesktops.number = 4;
      };
      panels = [
        {
          hiding = "dodgewindows";
          lengthMode = "fill";
          location = "bottom";
          opacity = "translucent";
          widgets = [
            "org.kde.plasma.kickoff"
            "org.kde.plasma.icontasks"
            "org.kde.plasma.marginsseparator"
            "org.kde.plasma.systemtray"
            "org.kde.plasma.digitalclock"
          ];
        }
      ];
      session = {
        general.askForConfirmationOnLogout = false;
        sessionRestore.restoreOpenApplicationsOnLogin = "onLastLogout";
      };
      shortcuts = {};
      spectacle.shortcuts = {
        launch = "Meta+Shift+S";
        recordRegion = "";
        recordScreen = "";
        recordWindow = "";
      };
      windows.allowWindowsToRememberPositions = true;
      workspace = {
        enableMiddleClickPaste = true;
        colorScheme = "BreezeDark";
        wallpaper = "/home/${username}/Pictures/bg.jpg";
        wallpaperFillMode = "stretch";
      };
    };
  };
}
