{
  config,
  flakePath,
  inputs,
  lib,
  userName,
  ...
}: let
  cfg = config.nMods.system;
in {
  options.nMods.system = {
    enable = lib.mkEnableOption "Enable System config" // {default = true;};
    timezone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/London";
      description = "Timezone";
    };
    locale = lib.mkOption {
      type = lib.types.str;
      default = "en_GB.UTF-8";
      description = "Locale to use";
    };
  };
  config = lib.mkMerge [
    {
      environment.variables = {
        FLAKE_PATH = "${flakePath}";
        LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
        SSH_AUTH_SOCK = "/home/${userName}/.bitwarden-ssh-agent.sock";
      };

      system.stateVersion = "24.05";
      nix = {
        settings.experimental-features = ["nix-command" "flakes"];
        optimise.automatic = true;
        nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      };
      nixpkgs.config.allowUnfree = true;
    }
    (lib.mkIf cfg.enable {
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
    })
  ];
}
