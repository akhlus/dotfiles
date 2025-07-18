{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.vscode;
  theme = builtins.fromTOML (builtins.readFile ../cosmetic/theme.toml);
  template = builtins.readFile ./template.json;
  replacements = [
    { from = "$NAME"; to = theme.name; }
    { from = "$VARIANT"; to = theme.variant; }
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
  options.hMods.vscode = {
    enable = lib.mkEnableOption "Enable VSCode Theme" // {default = true;};
    package = lib.mkPackageOption pkgs "vscode" {
      nullable = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = cfg.package;
    };
    home.file.".vscode/extensions/akhlus-theme/themes/akhlus-color-theme.json".text = generatedTheme;

    # You would also typically need a package.json for the extension.
    home.file.".vscode/extensions/akhlus-theme/package.json".text = builtins.toJSON {
      name = "akhlus-theme";
      displayName = "Akhlus Theme";
      description = "A theme generated from my personal color palette.";
      version = "0.0.1";
      engines = { vscode = "^1.0.0"; };
      categories = ["Themes"];
      contributes = {
        themes = [
          {
            label = "Akhlus";
            uiTheme = if theme.variant == "dark" then "vs-dark" else "vs";
            path = "./themes/akhlus-color-theme.json";
          }
        ];
      };
    };
  };
}
