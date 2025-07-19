{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.ghostty;
  theme = builtins.fromTOML (builtins.readFile ../cosmetic/theme.toml);
  removeHash = colour: lib.removePrefix "#" colour;
in {
  options.hMods.ghostty = {
    enable = lib.mkEnableOption "Enable Ghostty" // {default = true;};
    package = lib.mkPackageOption pkgs "ghostty" {
      nullable = true;
    };
  };
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/ghostty/themes/${theme.name}".text = ''
        background = ${removeHash theme.base00}
        background-opacity = ${theme.opacity_dec}
        foreground = ${removeHash theme.base05}
        cursor-color = ${removeHash theme.base05}
        selection-background = ${removeHash theme.base02}
        selection-foreground = ${removeHash theme.base05}
        palette = 0=${theme.base01}
        palette = 1=${theme.base08}
        palette = 2=${theme.base0B}
        palette = 3=${theme.base0A}
        palette = 4=${theme.base0D}
        palette = 5=${theme.base0E}
        palette = 6=${theme.base0C}
        palette = 7=${theme.base05}
        palette = 8=${theme.base03}
        palette = 9=${theme.base08}
        palette = 10=${theme.base0B}
        palette = 11=${theme.base0A}
        palette = 12=${theme.base0D}
        palette = 13=${theme.base0E}
        palette = 14=${theme.base0C}
        palette = 15=${theme.base07}
      '';
      ".config/ghostty/config".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/modules/hm/ghostty/ghostty-config";
    };
    programs.ghostty = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
