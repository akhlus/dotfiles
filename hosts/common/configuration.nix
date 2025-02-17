{
  pkgs,
  settings,
  ...
}: {
  imports = [
    ./boot.nix
    ./de/${settings.de}.nix
    ./../../programs/system.nix
  ];

  # Networking Settings
  networking.hostName = settings.hostname;
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Set your time zone.
  time.timeZone = settings.timezone;

  # Configure console keymap
  console.keyMap = "uk";
  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "gb";
    xkb.variant = "";
    excludePackages = [pkgs.xterm];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # Input Settings
  services.libinput.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${settings.name} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = ["networkmanager" "wheel"];
    #packages = with pkgs; [];
  };

  environment.variables = {
    FLAKE_PATH = "${settings.flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };

  system.stateVersion = "24.05";

  home-manager.backupFileExtension = "bak";

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
