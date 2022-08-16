inputs: let
  inherit (inputs) self nixpkgs;
  inherit (nixpkgs.lib) nixosSystem;

  commonModules = [
    inputs.nixpkgs.nixosModules.notDetected
    inputs.home-manager.nixosModules.home-manager
  ];
in {
  yukari = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules =
      [
        ./yukari.nix
        {
          home-manager.useGlobalPkgs = true;
          home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."yukari";
        }
      ]
      ++ commonModules;
  };

  kaguya = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      ./kaguya.nix
    ];
  };

  marisa = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [./marisa.nix];
  };
}
