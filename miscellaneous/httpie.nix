{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    httpie
  ];
}
