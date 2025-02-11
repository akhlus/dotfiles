{pkgs, ...}:{
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };
  environment.systemPackages = [ pkgs.nautilus];
}
