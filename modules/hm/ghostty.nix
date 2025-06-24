{pkgs, ...}: {
  home.file = {
    ".config/ghostty/themes/akhlus".source = ./files/ghostty.theme;
    ".config/ghostty/config".source = ./files/ghostty-config;
  };
  programs.ghostty = {
    enable = !pkgs.stdenv.isDarwin;
  };
}
