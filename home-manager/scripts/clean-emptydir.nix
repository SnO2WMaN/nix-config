{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    pkgs.writeShellScriptBin
    "clean_emptydir"
    "find . -type d -empty -delete"
  ];
}
