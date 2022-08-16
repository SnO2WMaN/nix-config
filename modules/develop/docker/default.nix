{
  config,
  lib,
  pkgs,
  ...
}: {
  virtualisation.docker = {enable = true;};
  users.users.sno2wman.extraGroups = ["docker"];
}
