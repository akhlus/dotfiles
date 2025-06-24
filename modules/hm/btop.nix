{...}: {
  home.file = {
    ".config/btop/themes/akhlus.theme".source = ./files/btop.theme;
  };
  programs.btop = {
    enable = true;
  };
}
