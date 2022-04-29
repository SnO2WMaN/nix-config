{ nixpkgs, ... }@inputs: {
  yukari = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [ ../hosts/yukari/configuration.nix ];
    specialArgs = inputs;
  };
}
