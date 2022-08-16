{
  config,
  lib,
  pkgs,
  nixpkgs,
  nixpkgs-wayland,
  nixgl,
  useful-scripts,
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

  nixpkgs.overlays = [
    # (final: prev: {
    #   clean-emptydir = (import ./clean-emptydir.nix) {pkgs = final;};
    #   listgroups = (import ./listgroups.nix) {pkgs = final;};
    #   listpath = (import ./listpath.nix) {pkgs = final;};
    # })
    nixpkgs-wayland.overlay
    nixgl.overlay
    useful-scripts.overlays.default
  ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "1password"
      "android-studio-stable"
      "discord"
      "gitkraken"
      "google-chrome"
      "mongodb-compass"
      "slack"
      "spotify-unwrapped"
      "spotify"
      "steam"
      "steam-original"
      "vscode"
    ];
  nixpkgs.config.permittedInsecurePackages = [
    "libdwarf-20181024"
  ];
}
