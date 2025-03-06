{...}: {
  imports = [
    ./../common/home.nix
    ../../programs/darwin.nix
  ];
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];
  systemd.user.startServices = "sd-switch";
}
