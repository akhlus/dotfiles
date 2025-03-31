{settings, pkgs, ...}: {
  home.username = "${settings.username}";
  home.homeDirectory = "/Users/${settings.username}";

  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.packages = with pkgs; [
    raycast
  ];
}
