{pkgs, ...}: {
  home.packages = [pkgs.xournalpp];
  home.file = {
    ".config/xournalpp/palette.gpl".source = ./files/palette.gpl;
    ".config/xournalpp/toolbar.ini".source = ./files/toolbar.ini;
    ".config/xournalpp/settings.xml" = {
      source = ./files/xournalpp-settings.xml;
      recursive = true;
    };
  };
}
