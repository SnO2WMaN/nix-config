{
  description = "A very basic flake";


  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-21.11";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    flake-registry = {
      url = "github:NixOS/flake-registry";
      flake = false;
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-unstable
    , nixpkgs-wayland
    , home-manager
    , nixos-hardware
    , flake-utils
    , ...
    }@inputs: {
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

        yukari = home-manager.lib.homeManagerConfiguration {
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

              ./modules/zsh
              ./modules/git
              ./modules/zellij
              ./modules/neovim
              ./modules/asdf-vm

              ./modules/fonts
              ./modules/gtk
              ./modules/alacritty
              ./modules/pcmanfm
              ./modules/ristretto
              ./modules/gscan2pdf

              ./modules/fcitx
              ./modules/firefox

              # ./modules/sway
              ./modules/sway/kanshi.nix
              ./modules/sway/mako.nix
              ./modules/sway/waybar.nix
              ./modules/sway/wofi.nix
              ./modules/gammastep

              ./modules/1password
              ./modules/gitkraken
              ./modules/spotify
              ./modules/slack
              # ./modules/discord
              ./modules/vscode
            ];
          };
        };
      };

      nixosConfigurations = import ./nixos/configuration.nix (inputs);

      marisa = self.homeConfigurations.marisa.activationPackage;
      yukari = self.homeConfigurations.marisa.activationPackage;
    };
}
