{
  pkgs,
  settings,
  specialArgs,
  ...
}: {
  imports = [
    ./boot.nix
    ./de/${settings.de}.nix
    ../../programs/nautilus.nix
  ];

  home-manager = {
    backupFileExtension = "bak";
    users.${settings.name}.imports = [
      ../${settings.type}/${settings.type}-home.nix
    ];
    extraSpecialArgs = specialArgs;
  };

  users.users.${settings.name} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = ["networkmanager" "wheel"];
  };

  networking = {
    hostName = settings.hostname;
    networkmanager.enable = true;
  };

  services = {
    fwupd.enable = true;
    libinput.enable = true;
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
    printing.enable = true;
    pulseaudio.enable = false;
    rtkit.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "gb";
      xkb.variant = "";
      excludePackages = [pkgs.xterm];
    };
  };

  environment.systemPackages = with pkgs; [
    gcc
    gparted
    libgcc
    lm_sensors
  ];

  programs = {
    seahorse.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
      ];
    };
  };

  fonts = {
    packages = with pkgs; [
      inter
      source-code-pro
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Inter Variable"];
        sansSerif = ["Inter Variable"];
        monospace = ["Source Code Pro"];
      };
    };
  };

  environment.variables = {
    FLAKE_PATH = "${settings.flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };

  time.timeZone = settings.timezone;
  console.keyMap = "uk";
  i18n.defaultLocale = settings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = settings.locale;
    LC_IDENTIFICATION = settings.locale;
    LC_MEASUREMENT = settings.locale;
    LC_MONETARY = settings.locale;
    LC_NAME = settings.locale;
    LC_NUMERIC = settings.locale;
    LC_PAPER = settings.locale;
    LC_TELEPHONE = settings.locale;
    LC_TIME = settings.locale;
  };

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;
}
