{
  ruff = {
    binary = {path_lookup = true;};
    initialization_options = {
      lineLength = 80;
      lint = {extendSelect=["I"];};
    };
  };
}
