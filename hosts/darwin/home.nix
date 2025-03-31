{
  pkgs,
  settings,
  ...
}: {
  imports = [
    ../../programs
  ];

  home.username = "${settings.name}";
  home.homeDirectory = "/${settings.home}/${settings.name}";

  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.packages = with pkgs; [
    raycast
  ];

  home.file = {
    "Pictures/background.jpg".source = ../../programs/files/tignes.jpg;
  };

  home.sessionVariables = {
    FLAKE_PATH = "${settings.flakePath}";
  };

  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;
}
