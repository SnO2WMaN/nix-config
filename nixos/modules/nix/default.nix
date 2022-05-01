{ config, lib, pkgs, nixpkgs, flake-registry, ... }:
{
  nix = {
    package = pkgs.nixFlakes;
    extraOptions =
      ''
        experimental-features = nix-command flakes
        flake-registry = ${flake-registry}
      '';

    nixPath = [ "nixpkgs=${nixpkgs}" ];

    # Storage optimize
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
