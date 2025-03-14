{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.packages = [pkgs.flatpak];

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    update.auto.enable = true;
    packages = [
      {
        appId = "app.zen_browser.zen";
        origin = "flathub";
      }
      "dev.zed.Zed"
      "com.brave.Browser"
    ];
  };
}
