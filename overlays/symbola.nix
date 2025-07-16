self: super: {
  symbola = super.symbola.overrideAttrs (oldAttrs: {
    src = super.fetchzip {
      url = "https://web.archive.org/web/20221006174450/https://dn-works.com/wp-content/uploads/2020/UFAS-Fonts/Symbola.zip";
      stripRoot = false;
      hash = "sha256-TsHWmzkEyMa8JOZDyjvk7PDhm239oH/FNllizNFf398=";
    };
  });
}
