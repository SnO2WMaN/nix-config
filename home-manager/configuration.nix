{
  home-manager,
  nixpkgs-wayland,
  nixgl,
  # , vscode-extensions
  ...
} @ inputs: let
  hmConfig = {extraConfigs ? []}: (home-manager.lib.homeManagerConfiguration {
    system = "x86_64-linux";
    stateVersion = "22.05";

    username = "sno2wman";
    homeDirectory = "/home/sno2wman";

    configuration = {...}: {
      imports = [] ++ extraConfigs;

      nixpkgs.overlays = [
        nixpkgs-wayland.overlay
        nixgl.overlay
        # vscode-extensions.overlay
        (import ./overlays/node-packages.nix)
      ];
    };
  });
in {
  kaguya = hmConfig {extraConfigs = [./kaguya.nix];};
  marisa = hmConfig {extraConfigs = [./marisa.nix];};
  yukari = hmConfig {extraConfigs = [./yukari.nix];};
}
