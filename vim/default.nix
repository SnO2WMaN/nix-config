{ config, pkgs, lib, ... }:
{
  programs.vim = {
    enable = true;
  };
  home.sessionVariables = {
    EDITOR = "vim";
  };
}
