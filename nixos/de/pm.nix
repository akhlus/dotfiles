{
  pkgs,
  username,
  ...
}: {
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
      configFile = {
        "kdeglobals"."General"."TerminalApplication" = "${pkgs.ghostty}/bin/ghostty --gtk-single-instance=true";
        "kdeglobals"."General"."TerminalService" = "com.mitchellh.ghostty.desktop";
        "kdeglobals"."KDE"."AnimationDurationFactor" = 0;
        "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
      };
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
        nightLight.enable = false;
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
      shortcuts = {
        "kwin"."Switch to Desktop 1" = ["Ctrl+F1" "Meta+1,Ctrl+F1,Switch to Desktop 1"];
        "kwin"."Switch to Desktop 2" = ["Ctrl+F2" "Meta+2,Ctrl+F2,Switch to Desktop 2"];
        "kwin"."Switch to Desktop 3" = ["Ctrl+F3" "Meta+3,Ctrl+F3,Switch to Desktop 3"];
        "kwin"."Switch to Desktop 4" = ["Ctrl+F4" "Meta+4,Ctrl+F4,Switch to Desktop 4"];
        "kwin"."Window Close" = ["Alt+F4" "Meta+Q,Alt+F4,Close Window"];
        "plasmashell"."activate task manager entry 1" = "none,Meta+1,Activate Task Manager Entry 1";
        "plasmashell"."activate task manager entry 10" = "none,,Activate Task Manager Entry 10";
        "plasmashell"."activate task manager entry 2" = "none,Meta+2,Activate Task Manager Entry 2";
        "plasmashell"."activate task manager entry 3" = "none,Meta+3,Activate Task Manager Entry 3";
        "plasmashell"."activate task manager entry 4" = "none,Meta+4,Activate Task Manager Entry 4";
        "plasmashell"."activate task manager entry 5" = "none,Meta+5,Activate Task Manager Entry 5";
        "plasmashell"."activate task manager entry 6" = "none,Meta+6,Activate Task Manager Entry 6";
        "plasmashell"."activate task manager entry 7" = "none,Meta+7,Activate Task Manager Entry 7";
        "plasmashell"."activate task manager entry 8" = "none,Meta+8,Activate Task Manager Entry 8";
        "plasmashell"."activate task manager entry 9" = "none,Meta+9,Activate Task Manager Entry 9";
        "plasmashell"."manage activities" = "none,Meta+Q,Show Activity Switcher";
        "services/com.mitchellh.ghostty.desktop"."_launch" = "Meta+Return";
        "services/org.kde.dolphin.desktop"."_launch" = "Meta+F";
        "services/org.kde.konsole.desktop"."_launch" = [];
        "services/org.kde.krunner.desktop"."_launch" = "Meta+Space";
        "services/org.kde.plasma-systemmonitor.desktop"."_launch" = [];
        "services/org.kde.plasma.emojier.desktop"."_launch" = "Meta+Ctrl+Alt+Shift+Space";
      };
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
