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
      dates = "monthly";
      options = "--delete-older-than 30d";
    };

    binaryCaches = [
      "https://cache.nixos.org"
      "https://cache.dhall-lang.org"
      "https://dhall.cachix.org"
    ];
    binaryCachePublicKeys = [
      "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
    ];
  };
}
