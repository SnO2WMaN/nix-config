{ config, pkgs, ... }:
{
  home.sessionPath = [
    "$HOME/.asdf/shims"
  ];
  home.packages = with pkgs; [
    asdf-vm
    gnupg
    unzip
  ];
}
