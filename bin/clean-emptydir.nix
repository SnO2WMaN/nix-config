{pkgs, ...}:
with pkgs;
  writeShellScriptBin "clean-emptydir" "find . -type d -empty -delete"
