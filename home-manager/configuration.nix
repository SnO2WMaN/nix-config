{
  nixpkgs,
  home-manager,
  nixpkgs-wayland,
  nixgl,
  # , vscode-extensions
  ...
} @ inputs: let
  hmConfig = {
    system ? "x86_64-linux",
    modules ? [],
  }: let
    pkgs = import nixpkgs {
      overlays = [
        nixpkgs-wayland.overlay
        nixgl.overlay
        (import ./overlays/node-packages.nix)
      ];
    };
  in (home-manager.lib.homeManagerConfiguration rec {
    inherit pkgs modules;
  });
in {
  kaguya = hmConfig {modules = [./kaguya.nix];};
  marisa = hmConfig {modules = [./marisa.nix];};
  yukari = hmConfig {modules = [./yukari.nix];};
}
