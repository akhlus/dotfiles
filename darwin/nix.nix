{inputs, userName, ...}: {
  nix = {
    gc = {
      automatic = true;
      options = "-d";
    };
    nixPath = ["nixpkgs=${inputs.nixpkgs-darwin}"];
    optimise.automatic = true;
    registry.nixpkgs.flake = inputs.nixpkgs-darwin;
    settings= {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = [userName];
    };
  };
  nixpkgs.config.allowUnfree = true;
}
