{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de = {
      environment = "gnome";
      enableAutoLogin = true;
    };
    steam.enable = true;
    ssh.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID+vBOkmJ3txsCh0rWlmYug/IFQIg8rdqQ420QYOinJV a3";
  };
}
