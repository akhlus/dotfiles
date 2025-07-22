{
  config,
  lib,
  ...
}: let
  cfg = config.hMods.cosmetic;
in {
  options.hMods.cosmetic = {
    themeFile = lib.mkOption {
      type = lib.types.path;
      default = ./theme.toml;
      description = "Path to the theme TOML fie";
    };
    theme = lib.mkOption {
      type = lib.types.attrs;
      default = builtins.fromTOML (builtins.readFile ./theme.toml);
      description = "Path to a toml theme file";
    };
    background = lib.mkOption {
      type = lib.types.path;
      default = ./bg.jpg;
      description = "Path to the file to use as background";
    };
  };
  config = {
    home.file = {"Pictures/bg.jpg".source = cfg.background;};
  };
}
