{ config, pkgs, ... }:
{
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/bat.nix
  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
    };
  };
}
