{settings, pkgs, ...}: {
  home.username = "${settings.name}";
  home.homeDirectory = "/${settings.home}/${settings.name}";

  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.packages = with pkgs; [
    raycast
  ];
}
