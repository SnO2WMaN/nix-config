{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wofi
  ];

  xdg.configFile."wofi/config".source = ./wofi/config;
  xdg.configFile."wofi/style.css".source = ./wofi/style.css;
}
