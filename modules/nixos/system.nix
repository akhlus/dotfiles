{
  config,
  lib,
  ...
}: let
  cfg = config.nixosModules.system;
in {
  options.nixosModules.system = {
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
    flakePath = lib.mkOption {
      type = lib.type.path;
      description = "Full path of the flake";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.variables = {
      FLAKE_PATH = "${cfg.flakePath}";
      LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
    };

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

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;
}
