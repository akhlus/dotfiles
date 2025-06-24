{flakePath, ...}: {
  imports = [
    ./de
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./nautilus.nix
    ./network.nix
    ./packages.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
  ];
  environment.variables = {
    FLAKE_PATH = "${flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;
}
