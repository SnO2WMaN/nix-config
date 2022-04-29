{
  description = "A very basic flake";


  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-21.11";
    };
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-unstable
    , nixpkgs-wayland
    , home-manager
    , flake-utils
    }: {
      homeConfigurations = {
        marisa = home-manager.lib.homeManagerConfiguration {
          system = "x86_64-linux";
          username = "sno2wman";
          homeDirectory = "/home/sno2wman";
          stateVersion = "22.05";

          configuration = { config, pkgs, ... }: {
            nixpkgs.overlays = [
              nixpkgs-wayland.overlay
            ];
            nixpkgs.config = {
              allowUnfree = true;
            };
            imports = [
              ./home-manager
              ./miscellaneous
              ./asdf-vm
              ./zellij

              ./pcmanfm
              ./ristretto

              ./1password
              ./gitkraken
              ./spotify

              ./git/ghq.nix
              ./git/git.nix

              ./zsh/starship.nix
            ];
          };
        };
      };

      marisa = self.homeConfigurations.marisa.activationPackage;
    };
}
