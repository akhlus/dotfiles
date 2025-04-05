{settings, ...}: {
  home.file = {
    ".config/btop/themes/akhlus.theme".source = ./files/btop.theme;
  };
  programs.btop = {
    enable = true;
    settings = {
      colour_theme = "${settings.flakePath}/.config/btop/themes/akhlus.theme";
    };
  };
}
