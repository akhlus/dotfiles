{settings,...}:{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "${settings.name}";
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
      "xournal++"
    ];
    masApps = {
      "Bitwarden" = 1352778147;
    };
    onActivation.cleanup = "zap";
  };
}
