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
			inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
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
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};
  };

  outputs = { self, ... }@inputs: {
    nixosConfigurations = import ./nixos/configuration.nix (inputs);
    homeConfigurations = import ./home-manager/configuration.nix (inputs);
  };
}
