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
    # vscode-extensions = {
    #   url = "path:./flakes/vscode-extensions";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-utils.follows = "flake-utils";
    # };
    # plemoljp = {
    #   url = "path:./flakes/plemoljp";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-utils.follows = "flake-utils";
    # };
    devshell.url = "github:numtide/devshell";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    vscode-marketplace.url = "github:AmeerTaweel/nix-vscode-marketplace";
  };

  outputs = {
    self,
    nixpkgs,
    devshell,
    flake-utils,
    vscode-marketplace,
    ...
  } @ inputs:
    {
      nixosConfigurations = import ./nixos inputs;
      homeConfigurations = import ./home-manager inputs;

      overlays.bin = import ./bin/overlay.nix;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            devshell.overlay
          ];
        };
      in {
        devShells.default = pkgs.devshell.mkShell {
          imports = [
            (pkgs.devshell.importTOML ./devshell.toml)
          ];
        };
      }
    );
}
