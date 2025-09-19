{
  inputs,
  username,
  ...
}: {
  nix = {
    gc = {
      automatic = true;
      options = "-d";
    };
    optimise.automatic = true;
    registry.nixpkgs.flake = inputs.nixpkgs;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = [username];
    };
  };
  nixpkgs.config.allowUnfree = true;
}
