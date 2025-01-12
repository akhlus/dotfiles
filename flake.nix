{
  description = "NixOS configuration";
  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-cosmic,
    nixos-cosmic,
    home-manager,
    stylix,
    ...
  }: let
    systemSettings = {
      hostname = "desktop";
      gpu = "nvidia"; #nvidia or other for now
      de = "gnome"; #gnome or cosmic - default: gnome
      use = "game"; #game or work
      system = "x86_64-linux";
      timezone = "Europe/London";
      locale = "en_GB.UTF-8";
    };
    userSettings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com";
      flakePath = "/home/${name}/.dotfiles";
      theme = "catpuccin mocha"; #stylix theme to use - set to "none" to disable
    };
    nixpkgs-de =
      if systemSettings.de == "cosmic"
      then nixpkgs-cosmic
      else nixpkgs;
    pkgs = nixpkgs-de.legacyPackages.${systemSettings.system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${systemSettings.system};
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
      nixos-cosmic.nixosModules.default
      ./de/cosmic.nix
    ];
    homeManagerModule = [
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          users.${userSettings.name}.imports = [./home.nix];
          extraSpecialArgs = specialArgs;
        };
      }
    ];
    deModules = (
      if systemSettings.de == "cosmic"
      then cosmicModules
      else [./de/gnome.nix]
    );
  in {
    nixosConfigurations."system" = lib.nixosSystem {
      system = systemSettings.system;
      specialArgs = specialArgs;
      modules =
        deModules
        ++ homeManagerModule
        ++ [
          stylix.nixosModules.stylix
          ./configuration.nix
          (./gpu + "/${systemSettings.gpu}.nix")
        ];
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
