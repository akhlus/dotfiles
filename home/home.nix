{
  config,
  pkgs,
  userSettings,
  systemSettings,
  ...
}:{

  home.username = "${userSettings.name}";
  home.homeDirectory = "/home/${userSettings.name}";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
    ".local/share/backgrounds/tignes.jpg".source = ./../stylix/tignes.jpg;
    ".config/xournalpp/palette.gpl".source = ./xournalpp/palette.gpl;
    ".config/xournalpp/settings.xml".source = ./xournalpp/settings.xml;
    ".config/xournalpp/toolbar.ini".source = ./xournalpp/toolbar.ini;
  };

  home.sessionVariables = {
  };

  imports = [
    ./zed/zed.nix
    if systemSettings.hostname == "penguin" then ./chrome.nix else ./nixos.nix
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
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "rebuild" = "sudo nixos-rebuild --flake ${userSettings.flakePath}#system";
      "home" = "home-manager --flake ${userSettings.flakePath}"
    };
  };
}
