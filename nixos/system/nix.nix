{
  inputs,
  userName,
  ...
}: {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "-d";
    };
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    optimise.automatic = true;
    registry.nixpkgs.flake = inputs.nixpkgs;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = [userName];
    };
  };
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
