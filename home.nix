{
  config,
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {

  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
    ".local/share/backgrounds/tignes.jpg".source = ./tignes.jpg;
    ".config/xournalpp/palette.gpl".source = ./xournalpp/palette.gpl;
    ".config/xournalpp/settings.xml".source = ./xournalpp/settings.xml;
    ".config/xournalpp/toolbar.ini".source = ./xournalpp/toolbar.ini;
    #".config/zed/settings.json".source=./zed/settings.json;
  };

  home.sessionVariables = {
  };

  imports = [
    (
      if systemSettings.de == "gnome"
      then ./de/gnome/dconf.nix
      else null
    )
    ./zed/zed.nix
  ];
  programs.git = {
    enable = true;
    userName = userSettings.username;
    userEmail = userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      lla = "ls -la";
      sam = "echo $TERM";
    };
  };
}
