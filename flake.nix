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
              ./modules/home-manager
              ./modules/miscellaneous
              ./modules/asdf-vm
              ./modules/zellij
              ./modules/neovim

              ./modules/pcmanfm
              ./modules/ristretto

              ./modules/gtk

              ./modules/gammastep

              ./modules/1password
              ./modules/gitkraken
              ./modules/spotify
              ./modules/slack

              ./modules/git/ghq.nix
              ./modules/git/git.nix

              ./modules/zsh/starship.nix
            ];
          };
        };
      };

      marisa = self.homeConfigurations.marisa.activationPackage;
    };
}
