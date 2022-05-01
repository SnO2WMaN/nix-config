{ config, pkgs, ... }:
{
  imports = [
    ./desktop.nix
    ./spotify-tui.nix
  ];
}
