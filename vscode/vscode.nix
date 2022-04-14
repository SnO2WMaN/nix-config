{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };
}
