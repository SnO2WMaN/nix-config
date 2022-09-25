{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix = {
    package = pkgs.nixFlakes;
    distributedBuilds = true;

    extraOptions = ''
      experimental-features = nix-command flakes
      builders-use-substitutes = true
      keep-outputs = true
      keep-derivations = true
    '';

    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };

    settings = {
      max-jobs = lib.mkDefault 8;
      auto-optimise-store = true;
      trusted-users = ["root" "sno2wman"];
    };

    buildMachines = lib.filter (x: x.hostName != config.networking.hostName) [
      {
        hostName = "remilia";
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        sshUser = "sno2wman";
        sshKey = "/home/sno2wman/.ssh/nix_remote";
        maxJobs = 24;
        speedFactor = 2;
        supportedFeatures = [
          "nixos-test"
          "benchmark"
          "big-parallel"
          "kvm"
        ];
        mandatoryFeatures = [];
      }
    ];
  };

  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
      "https://cache.iog.io"
      "https://danth.cachix.org"
      "https://dhall.cachix.org"
      "https://helix.cachix.org"
      "https://hydra.iohk.io"
      "https://lean4.cachix.org"
      "https://nix-community.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://sno2wman.cachix.org"
    ];
    trusted-public-keys = [
      "danth.cachix.org-1:wpodfSL7suXRc/rJDZZUptMa1t4MJ795hemRN0q84vI="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "lean4.cachix.org-1:mawtxSxcaiWE24xCXXgh3qnvlTkyU7evRRnGeAhD4Wk="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "sno2wman.cachix.org-1:JHDNKuz+q1xthbonwirDQzMZtwPrDnwCq3wUX3kmBVU="
    ];
  };
}
