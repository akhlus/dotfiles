{
  flakePath,
  lib,
  userName,
  ...
}: {
  home = {
    username = userName;
    homeDirectory = lib.mkDefault "/home/${userName}"; #overwritten for Darwin systems;
    sessionVariables = {FLAKE_PATH = "${flakePath}";};
    stateVersion = "24.11";
  };
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
}
