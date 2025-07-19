{
  flakePath,
  pkgs,
  ...
}: let
  # Derivation to build the theme image
  themeImage =
    pkgs.runCommand "cosmetic-theme-png" {
      # Python environment with necessary packages
      nativeBuildInputs = [
        (pkgs.python3.withPackages (ps: [
          ps.matplotlib
          ps.toml
        ]))
      ];
    } ''
      # Copy the script and its data into the build directory
      cp ${./render.py} ./render.py
      cp ${./theme.toml} ./theme.toml

      # Run the python script to generate the image
      python3 ./render.py

      # Move the generated image to the output path
      mkdir -p $out
      mv ./theme.png $out/theme.png
    '';
in {
  # Example of how to use the generated image:
  # This will link the generated png to the specified path in your home directory
  home.file."${flakePath}/modules/hm/cosmetic/theme.png".source = "${themeImage}/theme.png";
}
