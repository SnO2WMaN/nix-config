{ config, pkgs, ... }:
{
  imports = [
    ./waybar.nix
    ./wofi.nix
    ./sway.nix
  ];
  home.packages = with pkgs; [
    clipman
    mako
    wl-clipboard
    wf-recorder
    pavucontrol
  ];
}
