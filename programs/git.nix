{settings, ...}: {
  programs.git = {
    enable = true;
    userName = settings.gitUsername;
    userEmail = settings.gitEmail;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
  };
}
