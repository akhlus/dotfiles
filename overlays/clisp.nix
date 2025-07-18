final: prev: {
  clisp = prev.clisp.overrideAttrs (oldAttrs: {
    postInstall = let
      lib = prev.lib;
      withModules = prev.clisp.withModules or [];
    in oldAttrs.postInstall or "" + lib.optionalString (withModules != []) ''
      bash ${./clisp-link} add "$out"/lib/clisp-*/base "$(dirname "$out"/lib/clisp-*/base)"/full \
        ${lib.concatMapStrings (x: " " + x) withModules}
      find "$out"/lib/clisp-*/full -type l -name "*.o" | while read -r symlink; do
        if [[ "$(readlink "$symlink")" =~ (.*\/builddir\/)(.*) ]]; then
          ln -sf "../''${BASH_REMATCH[2]}" "$symlink"
        fi
      done
    '';
  });
}