{
  config,
  flakePath,
  pkgs,
  ...
}: {
  home.packages = [pkgs.xournalpp];
  home.file = {
    ".config/xournalpp/palette.gpl".source = ./palette.gpl;
    ".config/xournalpp/toolbar.ini".source = ./toolbar.ini;
    ".config/xournalpp/settings.xml".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/modules/hm/xournalpp/xournalpp-settings.xml";
  };
}
