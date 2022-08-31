{
  pkgs,
  writers,
  ...
}:
writers.writeBashBin "clean-emptydir" "find . -type d -empty -delete"
