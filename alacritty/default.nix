{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.75;
      font.normal.family = "JetBrains Mono";
    };
  };
}
