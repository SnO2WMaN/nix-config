{ config, pkgs, ... }:
{
  home.homeDirectory = builtins.getEnv "HOME";
  home.username = builtins.getEnv "USER";
  home.stateVersion = "22.05";
  home.language.base = "en_US.UTF-8";

  programs.home-manager. enable = true;

  home.packages = with pkgs; [ git ];
}
