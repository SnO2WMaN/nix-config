{
  pkgs,
  writers,
  ...
}:
writers.writeBashBin "remove-extensions" (
  builtins.readFile ./remove-extension.sh
)
