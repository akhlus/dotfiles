{inputs, pkgs, ...}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.packages = [ pkgs.flatpak ]

  services.flatpak = {
    enable = true;
    update.auto.enable = true;
    packages = [
      "dev.zed.Zed"
      "com.brave.Browser"
    ];
  };
}
