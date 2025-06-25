{
  flakePath,
  isDarwin,
  lib,
  pkgs,
  userName,
  ...
}: {
  home = {
    username = userName;
    homeDirectory =
      if isDarwin
      then "/Users/${userName}"
      else "/home/${userName}";
    file = {"Pictures/background.jpg".source = ./files/tignes.jpg;};
    sessionVariables = {FLAKE_PATH = "${flakePath}";};
    stateVersion = "24.11";
    sessionPath = lib.mkIf isDarwin ["/opt/homebrew/bin"];
    pointerCursor = lib.mkIf (!isDarwin) {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.afterglow-cursors-recolored;
      name = "Afterglow-Recolored-Catppuccin-Macchiato";
      size = 24;
    };
  };
}
