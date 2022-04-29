{ nixpkgs, ... }@inputs: {
  yukari = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [ ./yukari/configuration.nix ];
  };
}
