{ config, pkgs, ... }:
{
  imports = [
    ./firefox
    ./fonts.nix
    ./vscode
    ./gtk.nix
    ./fcitx
  ];
}
