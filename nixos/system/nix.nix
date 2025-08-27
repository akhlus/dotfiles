{
  inputs,
  userName,
  ...
}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    settings.trusted-users = [userName];
    optimise.automatic = true;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    gc = {
      automatic = true;
      interval = {
        Hour = 3;
        Minute = 15;
        Weekday = 7;
      };
      options = "-d";
    };
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
