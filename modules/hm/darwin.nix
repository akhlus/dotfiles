{
  pkgs,
  userName,
  ...
}: {
  home.username = "${userName}";
  home.homeDirectory = "/Users/${userName}";

  home.sessionPath = [
    "/opt/homebrew/bin"
  ];

  home.packages = with pkgs; [
    raycast
  ];
}
