{
  pkgs,
  writers,
  ...
}:
writers.writeBashBin "listgroups" "cat /etc/group | cut -d: -f1"
