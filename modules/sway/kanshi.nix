{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [ kanshi ];

  xdg.configFile."kanshi/config".source = ./kanshi/config;
}
