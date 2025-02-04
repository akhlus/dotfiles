{
  description = "NixOS configuration";
  outputs = inputs @ {
    self,
    ...
  }: let
    systemSettings = {
      hostname = "penguin";
      gpu = "other"; # [nvidia,other]
      de = "gnome"; # [*gnome*,kde,cosmic]
      use = "work"; #game or work
      system = "aarch64-linux"; # [x86_64-linux, aarch64-linux]
      timezone = "Europe/London";
      locale = "en_GB.UTF-8";
    };
    userSettings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com";
      flakePath = "/home/${name}/.dotfiles"; #full path
      theme = "mellow-purple"; #stylix theme to use - set to "none" to disable
    };
    nixpkgs-de =
      if systemSettings.de == "cosmic"
      then inputs.nixpkgs-cosmic
      else inputs.nixpkgs;
    #pkgs = nixpkgs-de.legacyPackages.${systemSettings.system};
    pkgs = import nixpkgs-de {
      system = systemSettings.system;
      overlays = [ inputs.nixgl.overlay ];
    };
    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${systemSettings.system};
    lib = nixpkgs-de.lib;
    specialArgs = {
      inherit pkgs-stable;
      inherit systemSettings;
      inherit userSettings;
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
    homeManagerModule = [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          users.${userSettings.name}.imports = [./home/home.nix];
          extraSpecialArgs = specialArgs;
        };
      }
    ];
    deModules = (
      if systemSettings.de == "cosmic"
      then cosmicModules
      else [./de/${systemSettings.de}.nix]
    );
  in {
    nixosConfigurations."system" = lib.nixosSystem {
      system = systemSettings.system;
      specialArgs = specialArgs;
      modules =
        deModules
        ++ homeManagerModule
        ++ [
          inputs.stylix.nixosModules.stylix
          inputs.solaar.nixosModules.default
          ./configuration.nix
          (./gpu + "/${systemSettings.gpu}.nix")
        ];
    };
    homeConfigurations."sam" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ 
        inputs.stylix.homeManagerModules.stylix
        ./home/home.nix 
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
    solaar.url = "github:Svenum/Solaar-Flake/main";
    solaar.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url="github:nix-community/nixGL";
  };
}
