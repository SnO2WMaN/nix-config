{ config, pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./delta.nix
    ./direnv.nix
    ./gh.nix
    ./ghq.nix
    ./git.nix
    ./jq.nix
    ./neovim.nix
    ./yq.nix
    ./zsh.nix
    ./starship.nix
    ./zellij.nix
  ];
}
