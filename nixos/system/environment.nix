{flakePath, ...}: {
  environment.variables = {
    FLAKE_PATH = "${flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };
}
