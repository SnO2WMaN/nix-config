{
  config,
  lib,
  pkgs,
  nixpkgs,
  ...
}: {
  imports = [
    ./cachix/dhall.nix
    ./cachix/nix-community.nix
    ./cachix/nixpkgs-wayland.nix
    ./cachix/helix.nix
    ./cachix/sno2wman.nix
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # Storage optimize
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };

    settings = {
      max-jobs = lib.mkDefault 4;
      auto-optimise-store = true;
      substituters = ["https://cache.nixos.org/"];
    };
  };

  nixpkgs.config.allowUnfreePackages = [
    "vscode"
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "libdwarf-20181024"
  ];
}
