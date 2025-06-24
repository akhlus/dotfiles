{userName, ...}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = userName;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    casks = [
      "anki"
      #"autodesk-fusion"
      "bambu-studio"
      #"calibre"
      #"kicad"
      "ghostty"
      "vivaldi"
      "xournal++"
      "zen"
    ];
    masApps = {
      "Bitwarden" = 1352778147;
    };
    onActivation.cleanup = "zap";
  };
}
