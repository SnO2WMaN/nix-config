{
  self,
  home-manager,
  nixpkgs-wayland,
  nixgl,
  useful-scripts,
  vscode-marketplace,
  hyprland,
  ...
} @ inputs: let
  hmConfig = {
    system ? "x86_64-linux",
    modules ? [],
  }: let
    pkgs = import nixpkgs {
      overlays = [
        self.overlays.bin
        nixpkgs-wayland.overlay
        nixgl.overlay
        useful-scripts.overlays.default
        (final: prev: {
          vscode-extensions = prev.vscode-extensions // vscode-marketplace.packages.${system};
        })
        (import ./overlays/node-packages.nix)
      ];
    };
  in (home-manager.lib.homeManagerConfiguration rec {
    inherit pkgs;
    modules =
      modules
      ++ [
        hyprland.homeManagerModules.default
      ];
  });
in {
  kaguya = hmConfig {modules = [./kaguya.nix];};
  marisa = hmConfig {modules = [./marisa.nix];};
  yukari = hmConfig {modules = [./yukari.nix];};
}
