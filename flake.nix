{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-marketplace = {
      url = "github:AmeerTaweel/nix-vscode-marketplace";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
    };
    base16-schemes = {
      url = "github:base16-project/base16-schemes";
      flake = false;
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server.url = "github:msteen/nixos-vscode-server";
    powercord-overlay.url = "github:LavaDesu/powercord-overlay";
    powercord-tokyonight = {
      url = "github:Dyzean/Tokyo-Night";
      flake = false;
    };
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    flake-utils.url = "github:numtide/flake-utils";

    yamlfmt = {
      url = "github:SnO2WMaN/yamlfmt.nix";
    };
  };

  outputs = {
    self,
    nixpkgs,
    devshell,
    flake-utils,
    yamlfmt,
    ...
  } @ inputs:
    {
      nixosConfigurations = import ./hosts inputs;
      # homeConfigurations = import ./home-manager inputs;

      overlays.default = import ./pkgs/overlay.nix;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = with inputs; [
            devshell.overlay
            agenix.overlays.default
          ];
        };
      in {
        devShells.default = pkgs.devshell.mkShell {
          packages = with pkgs; [
            direnv
            treefmt
            alejandra
            taplo-cli
            agenix
            actionlint
            yamlfmt.packages.${system}.yamlfmt
          ];
        };
      }
    );
}
