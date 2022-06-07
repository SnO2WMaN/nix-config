{ config, pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./mako.nix
    ./kanshi.nix
    ./waybar.nix
    ./wofi.nix
    ./wl-clipboard.nix
  ];
}
