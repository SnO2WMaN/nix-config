{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    yq
  ];
}
