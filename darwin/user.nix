{
  hostName,
  lib,
  pkgs,
  specialArgs,
  userName,
  ...
}: {
  users.users.${userName} = {
    name = "${userName}";
    home = "/Users/${userName}";
    shell = pkgs.zsh;
  };

  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    users.${userName} = {
      home = {
        sessionPath = ["/opt/homebrew/bin"];
        homeDirectory = lib.mkForce "/Users/${userName}";
        packages = pkgs.raycast;
      };
      imports = [
        ../hm
        ../hosts/${hostName}/home.nix
      ];
    };
  };
}
