{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix = {
    package = pkgs.nixVersions.stable;

    distributedBuilds = true;
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };

    settings = {
      experimental-features = ["nix-command" "flakes"];
      builders-use-substitutes = true;
      keep-outputs = true;
      keep-derivations = true;
      auto-optimise-store = true;
      # allow-import-from-derivation = true;
      trusted-users = ["root" "sno2wman"];
    };

    buildMachines = lib.filter (x: x.hostName != config.networking.hostName) [
      {
        hostName = "remilia";
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "i686-linux"
        ];
        sshUser = "nix-builder";
        sshKey = "/home/sno2wman/.ssh/id_nixbuilder";
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
      "https://nix-community.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://sno2wman.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "sno2wman.cachix.org-1:JHDNKuz+q1xthbonwirDQzMZtwPrDnwCq3wUX3kmBVU="
    ];
  };
}
