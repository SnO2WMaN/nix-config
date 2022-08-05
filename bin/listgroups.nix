{pkgs, ...}: with pkgs; writeShellScriptBin "listgroups" "cat /etc/group | cut -d: -f1"
