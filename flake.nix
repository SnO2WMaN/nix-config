{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
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
    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-extensions = {
      url = "path:./flakes/vscode-extensions";
    };
  };

  outputs = { self, ... }@inputs: {
    nixosConfigurations = import ./nixos/configuration.nix (inputs);
    homeConfigurations = import ./home-manager/configuration.nix (inputs);
  };
}
