{
  pkgs,
  writers,
  ...
}:
writers.writeBashBin "listpath" "echo $PATH | sed -e \"s/:/\\n/g\""
