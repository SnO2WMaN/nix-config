{ config, pkgs, ... }:
{
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/bottom.nix
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        color = "nord";
      };
    };
  };
}
