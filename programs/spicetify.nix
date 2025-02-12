{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  stylix.targets.spicetify.enable = false;

  programs.spicetify = {
    enable = true;
  };
}
