inputs: let
  inherit (inputs) self nixpkgs;
  inherit (nixpkgs.lib) nixosSystem;

  commonModules = [
    inputs.nixpkgs.nixosModules.notDetected
    inputs.home-manager.nixosModules.home-manager
    {home-manager.useGlobalPkgs = true;}
  ];
in {
  yukari = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules =
      [
        ./yukari.nix
        {home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."yukari";}
      ]
      ++ commonModules;
  };

  kaguya = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules =
      [
        ./kaguya.nix
        {home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."kaguya";}
      ]
      ++ commonModules;
  };

  marisa = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules =
      [
        ./marisa.nix
        {home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."marisa";}
      ]
      ++ commonModules;
  };
}
