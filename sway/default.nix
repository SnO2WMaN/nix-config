{ config, pkgs, ... }:
{
  imports = [
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
