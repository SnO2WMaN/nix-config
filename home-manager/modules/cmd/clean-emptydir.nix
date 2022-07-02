{
  config,
  pkgs,
  ...
}: let
  clean_emptydir = (
    pkgs.writeShellScriptBin
    "clean_emptydir"
    "find . -type d -empty -delete"
  );
in {
  home.packages = [clean_emptydir];
}
