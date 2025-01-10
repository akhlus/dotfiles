{
  ruff = {
    binary = {path_lookup = true;};
    initialization_options = {
      lineLength = 80;
      lint = {extendSelect=["I"];};
    };
  };
  nil = {
    binary = {path_lookup = true;};
    settings = {
      diagnostics.ignored = ["unused_binding"];
    };
  };
}
