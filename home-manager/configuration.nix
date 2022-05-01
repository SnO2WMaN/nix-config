{  home-manager, nixpkgs-wayland, ... }@inputs:
let
  hmConfig =
    { extraConfigs ? [ ]
    }:
    (home-manager.lib.homeManagerConfiguration {
      system = "x86_64-linux";
      stateVersion = "22.05";

      username = "sno2wman";
      homeDirectory = "/home/sno2wman";

      configuration = { ... }: {
        imports = [ ] ++ extraConfigs;

        nixpkgs.overlays = [
          nixpkgs-wayland.overlay
          (import ./overlays/vscode-extensions.nix)
        ];
      };
    });
in
{
  kaguya = hmConfig { extraConfigs = [ ./kaguya.nix ]; };
  marisa = hmConfig { extraConfigs = [ ./marisa.nix ]; };
  yukari = hmConfig { extraConfigs = [ ./yukari.nix ]; };
}
