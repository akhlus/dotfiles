# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = ["openssh:///home/sam/.ssh"];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 600;
    };

    "com/mattjakeman/ExtensionManager" = {last-used-version = "0.5.1";};

    "org/gnome/Console" = {
      last-window-maximised = false;
      last-window-size = mkTuple [1510 829];
    };

    "org/gnome/Extensions" = {window-maximized = true;};

    "org/gnome/Snapshot" = {
      capture-mode = "video";
      is-maximized = false;
      window-height = 640;
      window-width = 800;
    };

    "org/gnome/TextEditor" = {restore-session = false;};

    "org/gnome/Totem" = {
      active-plugins = [
        "variable-rate"
        "autoload-subtitles"
        "mpris"
        "screensaver"
        "apple-trailers"
        "screenshot"
        "skipto"
        "vimeo"
        "open-directory"
        "rotation"
        "save-file"
        "movie-properties"
        "recent"
      ];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/baobab/ui" = {
      active-chart = "rings";
      is-maximized = false;
      window-size = mkTuple [960 600];
    };

    "org/gnome/control-center" = {
      last-panel = "sound";
      window-state = mkTuple [980 640 false];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["Utilities" "YaST" "Pardus" "60d6a2f8-7774-4125-8d28-b157ec04dee7"];
    };

    "org/gnome/desktop/app-folders/folders/60d6a2f8-7774-4125-8d28-b157ec04dee7" = {
      apps = [
        "chromium-browser.desktop"
        "calibre-gui.desktop"
        "firefox.desktop"
        "com.mattjakeman.ExtensionManager.desktop"
        "onlyoffice-desktopeditors.desktop"
        "vlc.desktop"
        "code.desktop"
        "org.gnome.TextEditor.desktop"
        "protonvpn-app.desktop"
        "discord.desktop"
        "org.kicad.kicad.desktop"
        "anki.desktop"
        "org.kiwix.desktop.desktop"
        "org.qbittorrent.qBittorrent.desktop"
        "codium.desktop"
        "yt-dlg.desktop"
      ];
      name = "Apps";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = ["X-Pardus-Apps"];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [
        "gnome-abrt.desktop"
        "gnome-system-log.desktop"
        "nm-connection-editor.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.Connections.desktop"
        "org.gnome.DejaDup.desktop"
        "org.gnome.Dictionary.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.Evince.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.fonts.desktop"
        "org.gnome.Loupe.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.tweaks.desktop"
        "org.gnome.Usage.desktop"
        "vinagre.desktop"
        "org.gnome.Contacts.desktop"
        "org.gnome.Snapshot.desktop"
        "org.gnome.Tour.desktop"
        "yelp.desktop"
        "xterm.desktop"
        "cups.desktop"
        "org.gnome.Weather.desktop"
        "org.gnome.clocks.desktop"
        "org.gnome.Maps.desktop"
        "simple-scan.desktop"
        "org.gnome.SystemMonitor.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Totem.desktop"
        "org.gnome.Extensions.desktop"
        "org.gnome.Epiphany.desktop"
        "org.gnome.Geary.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Music.desktop"
        "gparted.desktop"
        "htop.desktop"
        "calibre-lrfviewer.desktop"
        "org.kicad.gerbview.desktop"
        "org.kicad.bitmap2component.desktop"
        "org.kicad.pcbcalculator.desktop"
        "org.kicad.pcbnew.desktop"
        "org.kicad.eeschema.desktop"
        "calibre-ebook-edit.desktop"
        "calibre-ebook-viewer.desktop"
        "ca.desrt.dconf-editor.desktop"
      ];
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
      apps = [
        "firefox.desktop"
        "org.gnome.TextEditor.desktop"
        "onlyoffice-desktopeditors.desktop"
        "org.kicad.kicad.desktop"
        "calibre-gui.desktop"
        "chromium-browser.desktop"
        "protonvpn-app.desktop"
        "code.desktop"
        "vlc.desktop"
      ];
      name = "Apps";
      translate = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = lib.mkDefault "file:///home/sam/.local/share/backgrounds/tignes.jpg";
      picture-uri-dark = lib.mkDefault "file:///home/sam/.local/share/backgrounds/tignes.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };


    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "gb"])];
      xkb-options = ["terminate:ctrl_alt_bksp"];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkDefault "prefer-dark";
      document-font-name = lib.mkForce "Inter Variable 11";
      enable-hot-corners = false;
      font-name = lib.mkForce "Inter Variable 11";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [
        "org-gnome-console"
        "gnome-power-panel"
        "dev-zed-zed"
        "spotify"
        "google-chrome"
        "org-gnome-settings"
        "discord"
        "org-gnome-baobab"
        "org-gnome-texteditor"
      ];
    };

    "org/gnome/desktop/notifications/application/anki" = {
      application-id = "anki.desktop";
    };

    "org/gnome/desktop/notifications/application/dev-zed-zed" = {
      application-id = "dev.zed.Zed.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/google-chrome" = {
      application-id = "google-chrome.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-texteditor" = {
      application-id = "org.gnome.TextEditor.desktop";
    };

    "org/gnome/desktop/notifications/application/spotify" = {
      application-id = "spotify.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {accel-profile = "flat";};

    "org/gnome/desktop/peripherals/stylus/default-04f3:2cf1" = {
      button-action = "default";
      eraser-pressure-curve = [0 0 100 100];
      pressure-curve = [0 0 100 100];
    };

    "org/gnome/desktop/peripherals/tablets/04f3:2cf1" = {
      area = [(-7.81e-4) (-1.302e-3) (-3.395e-3) (-1.543e-3)];
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
      disabled = [
        "org.gnome.Contacts.desktop"
        "org.gnome.seahorse.Application.desktop"
        "org.gnome.Characters.desktop"
        "org.gnome.clocks.desktop"
      ];
      sort-order = [
        "org.gnome.Documents.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Contacts.desktop"
        "org.gnome.Settings.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Characters.desktop"
        "org.gnome.clocks.desktop"
        "org.gnome.seahorse.Application.desktop"
      ];
    };

    "org/gnome/desktop/wm/keybindings" = {close = ["<Super>q"];};

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
    };

    "org/gnome/evolution-data-server" = {migrated = true;};

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 67;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "processes";
      show-dependencies = false;
      show-whose-processes = "user";
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      col-26-visible = false;
      col-26-width = 0;
      columns-order = [
        0
        1
        2
        3
        4
        6
        7
        8
        9
        10
        11
        12
        13
        14
        15
        16
        17
        18
        19
        20
        21
        22
        23
        24
        25
        26
      ];
      sort-col = 8;
      sort-order = 0;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [890 550];
      initial-size-file-chooser = mkTuple [890 550];
      maximized = true;
    };

    "org/gnome/portal/filechooser/google-chrome" = {
      last-folder-path = "/home/sam/Downloads";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
      home = ["<Super>f"];
      www = ["<Super>b"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "kgx";
      name = "terminal";
    };

    "org/gnome/shell" = {
      disabled-extensions = [];
      enabled-extensions = [
        "clipboard-indicator@tudmotu.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "caffeine@patapon.info"
        "appindicatorsupport@rgcjonas.gmail.com"
        "dash-to-panel@jderose9.github.com"
      ];
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "google-chrome.desktop"
        "dev.zed.Zed.desktop"
        "com.github.xournalpp.xournalpp.desktop"
        "spotify.desktop"
      ];
      welcome-dialog-last-shown-version = "47.1";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {settings-version = 2;};

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {blur = false;};

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      pipeline = "pipeline_default_rounded";
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-panel" = {
      blur-original-panel = true;
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
      toggle-state = false;
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
      preferred-monitor-by-connector = "DP-1";
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
      appicon-margin = 4;
      appicon-padding = 4;
      appicon-style = "NORMAL";
      available-monitors = [1 0];
      dot-position = "BOTTOM";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = true;
      leftbox-padding = 1;
      multi-monitors = true;
      overview-click-to-exit = false;
      panel-anchors = ''
        {"0":"MIDDLE","1":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
      '';
      panel-element-positions-monitors-sync = true;
      panel-lengths = ''
        {"0":100,"1":100}
      '';
      panel-positions = ''
        {"0":"TOP","1":"TOP"}
      '';
      panel-sizes = ''
        {"0":24,"1":24}
      '';
      primary-monitor = 1;
      progress-show-count = false;
      status-icon-padding = 1;
      stockgs-keep-dash = true;
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

    "org/gnome/shell/world-clocks" = {locations = [];};

    "org/gnome/tweaks" = {show-extensions-notice = false;};

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [867 372];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 167;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [26 23];
      window-size = mkTuple [1231 900];
    };
  };
}
