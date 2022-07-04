{
  config,
  lib,
  pkgs,
  nixpkgs,
  flake-registry,
  ...
}: {
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      flake-registry = ${flake-registry}
    '';

    nixPath = ["nixpkgs=${nixpkgs}"];

    # Storage optimize
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };

    binaryCaches = [
      "https://cache.nixos.org"
      "https://sno2wman.cachix.org"
      "https://dhall.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
    ];
    binaryCachePublicKeys = [
      "sno2wman.cachix.org-1:JHDNKuz+q1xthbonwirDQzMZtwPrDnwCq3wUX3kmBVU="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  };
}
