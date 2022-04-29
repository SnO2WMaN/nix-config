{ home-manager, nixpkgs-wayland, ... }@inputs:
let

  hmConfig =
    { extraConfigs ? [ ]
    , system ? "x86_64-linux"
    , version ? "22.05"
    }: (home-manager.lib.homeManagerConfiguration {
      system = "x86_64-linux";
      stateVersion = "22.05";

      username = "sno2wman";
      homeDirectory = "/home/sno2wman";

      configuration = { ... }: {
        imports = extraConfigs;

        nixpkgs.overlays = [
          nixpkgs-wayland.overlay
        ];
      };
    });

in
{
  yukari = hmConfig { extraConfigs = [ ./yukari.nix ]; };
  marisa = hmConfig { extraConfigs = [ ./marisa.nix ]; };
}
