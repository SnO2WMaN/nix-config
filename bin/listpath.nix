{pkgs, ...}:
with pkgs;
  writeShellScriptBin "listpath"
  "echo $PATH | sed -e \"s/:/\\n/g\""
