{systemSettings, ...}: {
  programs.gh = {
    enable = true;
    settings.git_protocol =
      if systemSettings.hostname == "penguin"
      then "https"
      else "ssh";
  };
}
