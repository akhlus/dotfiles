{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.zed;
  theme = builtins.fromTOML (builtins.readFile ../../cosmetic/theme.toml);
  template = builtins.readFile ./template.json;

  replacements = [
    { from = "$NAME"; to = theme.name; }
    { from = "$AUTHOR"; to = theme.author; }
    { from = "$VARIANT"; to = theme.variant; }
    { from = "_$OPACITY"; to = ""; }
    { from = "$COLOUR0_"; to = theme.base00; }
    { from = "$COLOUR1_"; to = theme.base01; }
    { from = "$COLOUR2_"; to = theme.base02; }
    { from = "$COLOUR3_"; to = theme.base03; }
    { from = "$COLOUR4_"; to = theme.base04; }
    { from = "$COLOUR5_"; to = theme.base05; }
    { from = "$COLOUR6_"; to = theme.base06; }
    { from = "$COLOUR7_"; to = theme.base07; }
    { from = "$COLOUR8_"; to = theme.base08; }
    { from = "$COLOUR9_"; to = theme.base09; }
    { from = "$COLOURA_"; to = theme.base0A; }
    { from = "$COLOURB_"; to = theme.base0B; }
    { from = "$COLOURC_"; to = theme.base0C; }
    { from = "$COLOURD_"; to = theme.base0D; }
    { from = "$COLOURE_"; to = theme.base0E; }
    { from = "$COLOURF_"; to = theme.base0F; }
  ];

  generatedTheme = lib.replaceStrings (map (r: r.from) replacements) (map (r: r.to) replacements) template;

in {
  options.hMods.zed = {
    enable = lib.mkEnableOption "Enable Zed" // {default = true;};
    package = lib.mkPackageOption pkgs "zed-editor" {
      nullable = false;
    };
  };
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/zed/themes/${theme.name}.json".text = generatedTheme;
      ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/modules/hm/files/zed-settings.json";
    };
    programs.zed-editor = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
