{ config, lib, pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
  };
  users.users.sno2wman.extraGroups = [ "networkmanager" ];
}
