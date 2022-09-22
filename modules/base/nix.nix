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
      substituters = ["https://cache.nixos.org/"];
    };

    buildMachines = lib.filter (x: x.hostName != config.networking.hostName) [
      {
        hostName = "remilia";
        system = "x86_64-linux";
        sshUser = "root";
        sshKey = "/home/sno2wman/.ssh/id_25519";
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
}
