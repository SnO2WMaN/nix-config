{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-22.05";
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
    nixgl = {
      url = "github:guibou/nixGL";
    };
    vscode-extensions = {
      url = "path:./flakes/vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    # plemoljp = {
    #   url = "path:./flakes/plemoljp";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-utils.follows = "flake-utils";
    # };
  };

  outputs = { self, ... }@inputs: {
    nixosConfigurations = import ./nixos/configuration.nix (inputs);
    homeConfigurations = import ./home-manager/configuration.nix (inputs);
  };
}
