inputs: let
  inherit (inputs) self nixpkgs;
  inherit (nixpkgs.lib) nixosSystem;

  commonModules = [
    inputs.nixpkgs.nixosModules.notDetected
    inputs.home-manager.nixosModules.home-manager
    {home-manager.useGlobalPkgs = true;}
  ];
in {
}
