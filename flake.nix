{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    #three options i change most split into own section
    machine = "penguin"; # one of the options in systems variable below
    deskEnv = "chrome"; # [gnome,kde,cosmic,chrome]
    stylixTheme = "local"; #stylix theme - [base16scheme, local, none] - none disables stylix
    
    settings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com"; #for git
      flakePath = "/home/${name}/.dotfiles"; #full path
      de = deskEnv;
      hostname = systems.${machine}.hostname;
      system = systems.${machine}.system;
      theme = stylixTheme; 
      locale = "en_GB.UTF-8";
      timezone = "Europe/London";
    };
    
    systems = {
      hp = {
        hostname = "hp";
        system = "x86_64-linux";
      };
      s340 = {
        hostname = "s340";
        system = "x86_64-linux";
      };
      desktop = {
        hostname = "desktop";
        system = "x86_64-linux";
      };
      penguin = {
        hostname = "penguin";
        system = "aarch64-linux";
      };
    };
    
    nixpkgs-de =
      if settings.de == "cosmic"
      then inputs.nixpkgs-cosmic
      else inputs.nixpkgs;

    pkgs = nixpkgs-de.legacyPackages.${settings.system};

    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${settings.system};
    
    specialArgs = {
      inherit pkgs-stable;
      inherit settings;
    };
  in {
    nixosConfigurations."system" = nixpkgs-de.lib.nixosSystem {
      system = settings.system;
      specialArgs = specialArgs;
      modules =
        [
          inputs.nixos-cosmic.nixosModules.default
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          ./hosts/${settings.hostname}/${settings.hostname}.nix
        ];
    };
    homeConfigurations."home" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.stylix.homeManagerModules.stylix
          ./hosts/${settings.hostname}/${settings.hostname}.nix
        ];
        extraSpecialArgs = specialArgs;
      };
  };
  inputs = {
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixpkgs-cosmic.follows = "nixos-cosmic/nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };
}
