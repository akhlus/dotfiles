{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    systemSettings = {
      hostname = "hp";
      de = "cosmic"; # [gnome, kde, cosmic]
      system = "x86_64-linux";
      timezone = "Europe/London";
      locale = "en_GB.UTF-8";
    };
    #change these for home-manager too
    userSettings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com"; #for git
      flakePath = "/home/${name}/.dotfiles"; #full path
      theme = "local"; #stylix theme - [base16scheme, local, none] - none disables stylix
    };

    nixpkgs-de =
      if systemSettings.de == "cosmic"
      then inputs.nixpkgs-cosmic
      else inputs.nixpkgs;

    pkgs = nixpkgs-de.legacyPackages.${systemSettings.system};

    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${systemSettings.system};
    lib = nixpkgs-de.lib;
    specialArgs = {
      inherit pkgs-stable;
      inherit systemSettings;
      inherit userSettings;
    };
    /*
    pkgs = import nixpkgs-de {
      system = systemSettings.system;
      overlays = [inputs.nixgl.overlay];
    };
    cosmicModules = [
      {
        nix.settings = {
          substituters = ["https://cosmic.cachix.org/"];
          trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
        };
      }
      inputs.nixos-cosmic.nixosModules.default
      ./de/cosmic.nix
    ];
    */
    homeManagerModule = [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          users.${userSettings.name}.imports = [./home/home.nix];
          extraSpecialArgs = specialArgs;
        };
      }
    ];
    /*
    deModules = (
      if systemSettings.de == "cosmic"
      then cosmicModules
      else [./de/${systemSettings.de}.nix]
    );
    */
  in {
    nixosConfigurations."system" = lib.nixosSystem {
      system = systemSettings.system;
      specialArgs = specialArgs;
      modules =
        #deModules
        #++ homeManagerModule ++
        [
          inputs.nixos-cosmic.nixosModules.default
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          ./hosts/${systemSettings.hostname}/${systemSettings.hostname}.nix
        ];
    };
    homeConfigurations."penguin" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        system = "aarch64-linux";
        #overlays = [inputs.nixgl.overlay];
      };
      modules = [
        inputs.stylix.homeManagerModules.stylix
        ./hosts/penguin/penguin.nix
      ];
      extraSpecialArgs = {inherit userSettings; systemSettings.hostname = "penguin"; inherit inputs;};
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
    nixgl.url = "github:nix-community/nixGL";
  };
}
