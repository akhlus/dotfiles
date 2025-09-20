{
  config,
  lib,
  pkgs,
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
      default = ./cassiopeia.png;
      description = "Path to the file to use as background";
    };
    enableCursor = lib.mkEnableOption "cursor management" // {default = !pkgs.stdenv.isDarwin;};
    cursorPackage = lib.mkPackageOption pkgs "afterglow-cursors-recolored" {};
    cursorName = lib.mkOption {
      description = "Name of cursor";
      type = lib.types.str;
      default = "Afterglow-Recolored-Catppuccin-Macchiato";
    };
    cursorSize = lib.mkOption {
      description = "Size of cursor to use";
      type = lib.types.int;
      default = 24;
    };
  };
  config = {
    home.file = {"Pictures/bg.png".source = cfg.background;};
    home.pointerCursor = lib.mkIf cfg.enableCursor {
      gtk.enable = true;
      x11.enable = true;
      package = cfg.cursorPackage;
      name = cfg.cursorName;
      size = cfg.cursorSize;
    };
  };
}
