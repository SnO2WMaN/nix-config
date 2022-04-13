{ config, pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./waybar.nix
    ./wofi.nix
  ];
}
