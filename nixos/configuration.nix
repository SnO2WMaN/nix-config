{ nixpkgs, ... }@inputs:
let
  nixosConfig =
    { extraModules ? [ ]
    }:
    (nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = [ ] ++ extraModules;
    });
in
{
  yukari = nixosConfig {
    extraModules = [ ./yukari.nix ];
  };
}
