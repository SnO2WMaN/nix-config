{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
  ];
  fonts.fontconfig.enable = lib.mkForce true;
}
