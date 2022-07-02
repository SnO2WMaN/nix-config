{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs-18_x
    nodePackages.yarn
    nodePackages.pnpm
  ];
}
