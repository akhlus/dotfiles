{pkgs, ...}: {
  home.packages = [pkgs.xournalpp];
  home.file = {
    ".config/xournalpp/palette.gpl".source = ./files/palette.gpl;
    ".config/xournalpp/toolbar.ini".source = ./files/toolbar.ini;
  };
}
