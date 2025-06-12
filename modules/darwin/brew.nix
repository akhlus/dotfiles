{settings,...}:{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "${settings.username}";
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    casks = [
      "anki"
      #"autodesk-fusion"
      "bambu-studio"
      #"calibre"
      "chromium"
      #"kicad"
      "ghostty"
      "vivaldi"
      "xournal++"
    ];
    masApps = {
      "Bitwarden" = 1352778147;
    };
    onActivation.cleanup = "zap";
  };
}
