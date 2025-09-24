{...}: {
  programs = {
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
      fonts = {
        fixedWidth = {
          family = "Lilex Nerd Font Mono";
          pointSize = 12;
        };
        general = {
          family = "IBM Plex Sans";
          pointSize = 12;
        };
        menu = {
          family = "IBM Plex Sans";
          pointSize = 12;
        };
        small = {
          family = "IBM Plex Sans";
          pointSize = 9;
        };
        toolbar = {
          family = "IBM Plex Sans";
          pointSize = 12;
        };
        windowTitle = {
          family = "IBM Plex Sans";
          pointSize = 12;
        };
      };
      workspace = {
      };
    };
  };
}
