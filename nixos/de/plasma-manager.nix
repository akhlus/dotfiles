{...}: {
  programs = {
    kate = {
      enable = true;
      editor = {
        brackets.automaticallyAddClosing = true;
        font = {
          family = "Lilex Nerd Font Mono";
          pointSize = 12;
        };
      };
      lsp.customServers = {};
    };
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
      workspace = {
      };
    };
  };
}
