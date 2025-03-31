{settings, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      colour_theme = "${settings.flakePath}/modules/hm/files/akhlus.theme";
    };
  };
}
