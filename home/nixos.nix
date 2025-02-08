{pkgs, ...}: {
  home.packages = with pkgs; [
    #nixgl.nixGLMesa
  ];
}
