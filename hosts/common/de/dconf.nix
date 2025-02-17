# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/TextEditor" = {
      restore-session = false;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["Utilities" "YaST" "Pardus" "60d6a2f8-7774-4125-8d28-b157ec04dee7"];
    };

    "org/gnome/desktop/app-folders/folders/60d6a2f8-7774-4125-8d28-b157ec04dee7" = {
      apps = ["onlyoffice-desktopeditors.desktop" "calibre-gui.desktop" "google-chrome.desktop" "com.mattjakeman.ExtensionManager.desktop" "code.desktop" "vlc.desktop" "org.gnome.TextEditor.desktop" "org.kicad.kicad.desktop" "chromium-browser.desktop" "firefox.desktop" "protonvpn-app.desktop" "anki.desktop" "org.kiwix.desktop.desktop" "org.qbittorrent.qBittorrent.desktop" "codium.desktop" "yt-dlg.desktop" "com.mitchellh.ghostty.desktop" "Vial.desktop"];
      name = "Apps";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = ["X-Pardus-Apps"];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = ["gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" "org.gnome.Contacts.desktop" "org.gnome.Snapshot.desktop" "org.gnome.Tour.desktop" "yelp.desktop" "xterm.desktop" "cups.desktop" "org.gnome.Weather.desktop" "org.gnome.clocks.desktop" "org.gnome.Maps.desktop" "simple-scan.desktop" "org.gnome.SystemMonitor.desktop" "org.gnome.Calculator.desktop" "org.gnome.Totem.desktop" "org.gnome.Extensions.desktop" "org.gnome.Epiphany.desktop" "org.gnome.Geary.desktop" "org.gnome.Calendar.desktop" "org.gnome.Music.desktop" "gparted.desktop" "htop.desktop" "calibre-lrfviewer.desktop" "org.kicad.gerbview.desktop" "org.kicad.bitmap2component.desktop" "org.kicad.pcbcalculator.desktop" "org.kicad.pcbnew.desktop" "org.kicad.eeschema.desktop" "calibre-ebook-edit.desktop" "calibre-ebook-viewer.desktop" "ca.desrt.dconf-editor.desktop"];
      categories = ["X-GNOME-Utilities"];
      excluded-apps = ["org.gnome.Console.desktop"];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = ["X-SuSE-YaST"];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/e3009b03-4a6c-456c-ac33-e9e77f607f9b" = {
      apps = ["firefox.desktop" "org.gnome.TextEditor.desktop" "onlyoffice-desktopeditors.desktop" "org.kicad.kicad.desktop" "calibre-gui.desktop" "chromium-browser.desktop" "protonvpn-app.desktop" "code.desktop" "vlc.desktop"];
      name = "Apps";
      translate = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      accel-profile = "flat";
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/sam/.local/share/backgrounds/tignes.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = ["org.gnome.Contacts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Characters.desktop" "org.gnome.clocks.desktop"];
      sort-order = ["org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Settings.desktop" "org.gnome.Calculator.desktop" "org.gnome.Calendar.desktop" "org.gnome.Epiphany.desktop" "org.gnome.Characters.desktop" "org.gnome.clocks.desktop" "org.gnome.Contacts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Weather.desktop"];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/list-view" = {
      use-tree-view = true;
    };

    "org/gnome/nautilus/preferences" = {
      date-time-format = "detailed";
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
      home = ["<Super>f"];
      www = ["<Super>b"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "ghostty";
      name = "terminal";
    };

    "org/gnome/shell" = {
      disabled-extensions = [];
      enabled-extensions = ["clipboard-indicator@tudmotu.com" "blur-my-shell@aunetx" "dash-to-dock@micxgx.gmail.com" "caffeine@patapon.info" "appindicatorsupport@rgcjonas.gmail.com" "dash-to-panel@jderose9.github.com"];
      favorite-apps = ["org.gnome.Nautilus.desktop" "brave-browser.desktop" "dev.zed.Zed.desktop" "com.github.xournalpp.xournalpp.desktop" "spotify.desktop"];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "47.1";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/hidetopbar" = {
      compatibility = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      brightness = 0.6;
      pipeline = "pipeline_default";
      sigma = 30;
      static-blur = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/caffeine" = {
      countdown-timer = 0;
      indicator-position-max = 1;
      show-notifications = false;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      autohide-in-fullscreen = true;
      background-opacity = 0.8;
      custom-theme-shrink = true;
      dash-max-icon-size = 40;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
      multi-monitor = true;
      preferred-monitor = -2;
      running-indicator-style = "DOTS";
      shortcut = ["<Super>p"];
      shortcut-text = "<Super>p";
      show-icons-notifications-counter = false;
      show-mounts = false;
      show-show-apps-button = true;
      show-trash = false;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-app-switch = false;
      animate-window-launch = false;
      appicon-margin = 2;
      appicon-padding = 2;
      appicon-style = "NORMAL";
      dot-position = "BOTTOM";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      leftbox-padding = 1;
      multi-monitors = false;
      panel-anchors = ''{"0":"MIDDLE"}'';
      panel-element-positions = ''{"0":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'';
      panel-lengths = ''{"0":100}'';
      panel-positions = ''{"0":"TOP"}'';
      panel-sizes = ''{"0":24}'';
      primary-monitor = 0;
      progress-show-count = false;
      status-icon-padding = 1;
      stockgs-keep-dash = true;
      taskbar-locked = false;
      trans-use-custom-bg = false;
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = false;
      tray-padding = 1;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/keybindings" = {
      screenshot = ["Print"];
      show-screenshot-ui = ["<Shift><Super>s"];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };
  };
}
