{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./gh.nix
    ./ghq.nix
    ./git-crypt.nix
  ];
}
