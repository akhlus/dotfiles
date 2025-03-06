{...}: {
  imports = [
    ./../common/home.nix
    ./../../programs/linux.nix
  ];
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];
  systemd.user.startServices = "sd-switch";
}
