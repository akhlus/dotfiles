{
  userSettings,
  systemSettings,
  ...
}: {
  home.username = "${userSettings.name}";
  home.homeDirectory = "/home/${userSettings.name}";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
    ".local/share/backgrounds/tignes.jpg".source = ./../stylix/tignes.jpg;
    ".config/zed/themes/akhlus.json".source = ./zed/akhlus.json;
    ".config/xournalpp/palette.gpl".source = ./xournalpp/palette.gpl;
    ".config/xournalpp/toolbar.ini".source = ./xournalpp/toolbar.ini;
  };

  imports = [
    ./zed/zed.nix
    ./../stylix/stylix.nix
    (
      if systemSettings.hostname == "penguin"
      then ./chrome.nix
      else ./nixos.nix
    )
  ];
}
