{settings, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      colour_theme = "${settings.flakePath}/programs/files/akhlus.theme";
    };
  };
}
