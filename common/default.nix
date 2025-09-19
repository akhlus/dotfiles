{
  flakePath,
  hostname,
  ...
}: {
  imports = [
    ./nix.nix
    ./user.nix
  ];
  networking.hostName = hostname;
  environment.variables = {
    FLAKE_PATH = "${flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };
}
