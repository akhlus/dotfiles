{pkgs, ...}: {
  home.pointerCursor = {
    #technically hm option but only want to apply to nixos systems
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.afterglow-cursors-recolored;
    name = "Afterglow-Recolored-Catppuccin-Macchiato";
    size = 24;
  };
}
