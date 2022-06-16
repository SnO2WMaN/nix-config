{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    satysfi
  ];
}
