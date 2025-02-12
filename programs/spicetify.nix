{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  stylix.targets.zed.enable = false;

  programs.spicetify = {
    enable = true;
  };
}
