{ config, pkgs, ... }:
{
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/neofetch.nix
  programs.neofetch = {
    enable = true;
  };
}
