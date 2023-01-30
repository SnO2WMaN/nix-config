{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.sane = {
    enable = true;
  };
  users.users.sno2wman.extraGroups = ["scanner" "lp"];
}
