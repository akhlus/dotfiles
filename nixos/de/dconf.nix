# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/TextEditor" = {
      restore-session = false;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["Utilities" "YaST" "Pardus" "60d6a2f8-7774-4125-8d28-b157ec04dee7" "c3a4e438-69ed-4fd0-bbcf-b2cbcd3dbc2b" "1ff8813d-a272-49f7-8c95-9f4dc4a36bc9"];
    };

    "org/gnome/desktop/app-folders/folders/1ff8813d-a272-49f7-8c95-9f4dc4a36bc9" = {
      apps = ["Trackmania.desktop" "steam.desktop" "tModLoader.desktop" "Hades.desktop" "Terraria.desktop" "Celeste.desktop"];
      name = "Games";
    };

    "org/gnome/desktop/app-folders/folders/60d6a2f8-7774-4125-8d28-b157ec04dee7" = {
      apps = ["onlyoffice-desktopeditors.desktop" "calibre-gui.desktop" "google-chrome.desktop" "com.mattjakeman.ExtensionManager.desktop" "code.desktop" "vlc.desktop" "org.gnome.TextEditor.desktop" "org.kicad.kicad.desktop" "chromium-browser.desktop" "firefox.desktop" "protonvpn-app.desktop" "anki.desktop" "org.kiwix.desktop.desktop" "org.qbittorrent.qBittorrent.desktop" "codium.desktop" "yt-dlg.desktop" "Vial.desktop" "startcenter.desktop" "mpv.desktop" "cursor.desktop" "bitwarden.desktop" "discord.desktop" "openscad.desktop" "BambuStudio.desktop"];
      name = "Apps";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = ["X-Pardus-Apps"];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/System" = {
      apps = ["org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Logs.desktop" "org.gnome.SystemMonitor.desktop"];
      name = "X-GNOME-Shell-System.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = ["gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" "org.gnome.Contacts.desktop" "org.gnome.Snapshot.desktop" "org.gnome.Tour.desktop" "yelp.desktop" "xterm.desktop" "cups.desktop" "org.gnome.Weather.desktop" "org.gnome.clocks.desktop" "org.gnome.Maps.desktop" "simple-scan.desktop" "org.gnome.SystemMonitor.desktop" "org.gnome.Calculator.desktop" "org.gnome.Totem.desktop" "org.gnome.Extensions.desktop" "org.gnome.Epiphany.desktop" "org.gnome.Geary.desktop" "org.gnome.Calendar.desktop" "org.gnome.Music.desktop" "gparted.desktop" "htop.desktop" "calibre-lrfviewer.desktop" "org.kicad.gerbview.desktop" "org.kicad.bitmap2component.desktop" "org.kicad.pcbcalculator.desktop" "org.kicad.pcbnew.desktop" "org.kicad.eeschema.desktop" "calibre-ebook-edit.desktop" "calibre-ebook-viewer.desktop" "ca.desrt.dconf-editor.desktop" "btop.desktop" "nixos-manual.desktop" "org.gnome.Console.desktop" "solaar.desktop" "qv4l2.desktop" "qvidcap.desktop" "nvtop.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Characters.desktop" "org.gnome.Decibels.desktop"];
      categories = ["X-GNOME-Utilities"];
      excluded-apps = [];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = ["X-SuSE-YaST"];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/c3a4e438-69ed-4fd0-bbcf-b2cbcd3dbc2b" = {
      apps = ["calc.desktop" "base.desktop" "draw.desktop" "impress.desktop" "math.desktop" "writer.desktop"];
      name = "Office";
    };

    "org/gnome/desktop/app-folders/folders/e3009b03-4a6c-456c-ac33-e9e77f607f9b" = {
      apps = ["firefox.desktop" "org.gnome.TextEditor.desktop" "onlyoffice-desktopeditors.desktop" "org.kicad.kicad.desktop" "calibre-gui.desktop" "chromium-browser.desktop" "protonvpn-app.desktop" "code.desktop" "vlc.desktop"];
      name = "Apps";
      translate = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/sam/Pictures/bg.jpg";
      picture-uri-dark = "file:///home/sam/Pictures/bg.jpg";
    };

    "org/gnome/desktop/interface" = {
      accent-color = "teal";
      cursor-theme = "Afterglow-Recolored-Catppuccin-Macchiato";
      color-scheme = "prefer-dark";
      document-font-name = "Inter Variable 12";
      enable-animations = false;
      enable-hot-corners = false;
      font-name = "Inter Variable 12";
      gtk-theme = "Adwaita";
      icon-theme = "Adwaita";
      monospace-font-name = "BlexMono Nerd Font 12";
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
      picture-uri = "file:///home/sam/Pictures/bg.jpg";
      picture-uri-dark = "file:///home/sam/Pictures/bg.jpg";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = ["org.gnome.Contacts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Characters.desktop" "org.gnome.clocks.desktop"];
      sort-order = ["org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Settings.desktop" "org.gnome.Calculator.desktop" "org.gnome.Calendar.desktop" "org.gnome.Epiphany.desktop" "org.gnome.Characters.desktop" "org.gnome.clocks.desktop" "org.gnome.Contacts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Weather.desktop"];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      maximize = [];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,close";
      focus-mode = "sloppy";
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = false;
      experimental-features = ["scale-monitor-framebuffer"];
      workspaces-only-on-primary = true;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
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
      enabled-extensions = ["clipboard-indicator@tudmotu.com" "blur-my-shell@aunetx" "dash-to-dock@micxgx.gmail.com" "caffeine@patapon.info" "appindicatorsupport@rgcjonas.gmail.com" "dash-to-panel@jderose9.github.com" "tilingshell@ferrarodomenico.com"];
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
      hot-keys = false;
      intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
      multi-monitor = true;
      preferred-monitor = -2;
      running-indicator-style = "DOTS";
      show-icons-notifications-counter = false;
      show-mounts = false;
      show-show-apps-button = true;
      show-trash = false;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-app-switch = false;
      animate-window-launch = false;
      appicon-margin = 4;
      dot-position = "BOTTOM";
      intellihide = true;
      intellihide-behaviour = "ALL_WINDOWS";
      intellihide-hide-from-windows = true;
      prefs-opened = false;
      stockgs-keep-dash = true;
    };

    "org/gnome/shell/extensions/tilingshell" = {
      enable-window-border = false;
      inner-gaps = mkUint32 2;
      last-version-name-installed = "16.4";
      layouts-json = "[{\"id\":\"Layout 2\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.24973958333333332,\"height\":0.24861111111111112,\"groups\":[1,4]},{\"x\":0.24973958333333332,\"y\":0,\"width\":0.5005208333333333,\"height\":0.5,\"groups\":[2,3,1]},{\"x\":0.7502604166666667,\"y\":0,\"width\":0.24973958333333335,\"height\":1,\"groups\":[2]},{\"x\":0.24973958333333332,\"y\":0.5,\"width\":0.5005208333333333,\"height\":0.5,\"groups\":[3,2,1]},{\"x\":0,\"y\":0.24861111111111112,\"width\":0.24973958333333332,\"height\":0.751388888888889,\"groups\":[4,1]}]},{\"id\":\"483365\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.5,\"height\":0.5,\"groups\":[1,2]},{\"x\":0.5,\"y\":0,\"width\":0.49999999999999994,\"height\":0.5,\"groups\":[3,1]},{\"x\":0,\"y\":0.5,\"width\":0.5,\"height\":0.5,\"groups\":[2,1]},{\"x\":0.5,\"y\":0.5,\"width\":0.49999999999999994,\"height\":0.49999999999999994,\"groups\":[3,1]}]},{\"id\":\"1186829\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.24973958333333332,\"height\":0.5,\"groups\":[1,5]},{\"x\":0.24973958333333332,\"y\":0,\"width\":0.5005208333333333,\"height\":0.5,\"groups\":[2,3,1]},{\"x\":0.7502604166666667,\"y\":0,\"width\":0.2497395833333329,\"height\":0.5,\"groups\":[4,2]},{\"x\":0.24973958333333332,\"y\":0.5,\"width\":0.5005208333333333,\"height\":0.5,\"groups\":[3,2,1]},{\"x\":0.7502604166666667,\"y\":0.5,\"width\":0.2497395833333329,\"height\":0.49999999999999994,\"groups\":[4,2]},{\"x\":0,\"y\":0.5,\"width\":0.24973958333333332,\"height\":0.5,\"groups\":[5,1]}]}]";
      outer-gaps = mkUint32 2;
      overridden-settings = "{\"org.gnome.mutter.keybindings\":{\"toggle-tiled-right\":\"['<Super>Right']\",\"toggle-tiled-left\":\"['<Super>Left']\"},\"org.gnome.desktop.wm.keybindings\":{\"maximize\":\"['<Super>Up']\",\"unmaximize\":\"['<Super>Down', '<Alt>F5']\"},\"org.gnome.mutter\":{\"edge-tiling\":\"true\"}}";
      selected-layouts = [["Layout 2"] ["Layout 2"]];
      snap-assistant-animation-time = mkUint32 0;
      tile-preview-animation-time = mkUint32 0;
      top-edge-maximize = true;
      window-border-color = "rgb(129,61,156)";
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
