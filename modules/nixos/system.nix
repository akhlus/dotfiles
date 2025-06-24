{
  config,
  flakePath,
  lib,
  ...
}: let
  cfg = config.customModules.system;
in {
  options.customModules.system = {
    enable = lib.mkOption "Enable System config" // {default = true;};
    timezone = lib.mkOption {
      type = lib.type.string;
      default = "Europe/London";
      description = "Timezone";
    };
    locale = lib.mkOption {
      type = lib.type.string;
      default = "en_GB.UTF-8";
      description = "Locale to use";
    };
  };
  config = lib.mkIf cfg.enable {
    time.timeZone = cfg.timezone;
    console.keyMap = "uk";
    i18n.defaultLocale = cfg.locale;
    i18n.extraLocaleSettings = {
      LC_ADDRESS = cfg.locale;
      LC_IDENTIFICATION = cfg.locale;
      LC_MEASUREMENT = cfg.locale;
      LC_MONETARY = cfg.locale;
      LC_NAME = cfg.locale;
      LC_NUMERIC = cfg.locale;
      LC_PAPER = cfg.locale;
      LC_TELEPHONE = cfg.locale;
      LC_TIME = cfg.locale;
    };
  };

  environment.variables = {
    FLAKE_PATH = "${flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;
}
