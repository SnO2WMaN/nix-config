{ config, lib, pkgs, ... }:
{
  # programs.adb.enable = true;
  users.users.sno2wman.extraGroups = [
    "adbusers"
  ];
}
