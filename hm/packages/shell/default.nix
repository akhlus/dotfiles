{
  config,
  flakePath,
  lib,
  ...
}: let
  cfg = config.hMods.packages.shell;
  alias = {
    "la" = "ls -a";
    "lt" = "eza --tree --level=2 --long --git";
    "lta" = "lt -a";
    "python" = "python3";
    "py" = "python3";
    "nrb" = "sh ${flakePath}/update.sh -p ${flakePath} -s nixos ";
    "ns" = "sh ${flakePath}/update.sh -p ${flakePath} -s nixos -m switch";
    "home" = "sh ${flakePath}/update.sh -p ${flakePath} -s home";
    "hs" = "sh ${flakePath}/update.sh -p ${flakePath} -s home -m switch";
    "darwin" = "sh ${flakePath}/update.sh -p ${flakePath} -s darwin";
    "ds" = "sh ${flakePath}/update.sh -p ${flakePath} -s darwin -m switch";
  };
in {
  options.hMods.packages.shell = {
    enableZsh = lib.mkEnableOption "Enable zsh" // {default = true;};
    enableBash = lib.mkEnableOption "Enable bash" // {default = true;};
  };
  config = {
    programs = {
      zsh = {
        enable = cfg.enableZsh;
        shellAliases = alias;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh.enable = true;
      };
      bash = {
        enable = cfg.enableBash;
        shellAliases = alias;
      };
      starship = {
        enable = true;
        settings = builtins.fromTOML (builtins.readFile ./starship.toml);
      };
    };
    home.shell = {
      enableBashIntegration = cfg.enableBash;
      enableZshIntegration = cfg.enableZsh;
    };
  };
}
