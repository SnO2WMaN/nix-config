inputs: let
  inherit (inputs) self nixpkgs;
  inherit (nixpkgs.lib) nixosSystem;

  commonModules = [
    inputs.nixpkgs.nixosModules.notDetected
    inputs.home-manager.nixosModules.home-manager
    {
      system.stateVersion = "22.05";
    }
  ];

  mkNixosSystem = {extraModules ? []}:
    nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = extraModules ++ commonModules;
    };
in {
  yukari = mkNixosSystem {
    extraModules = [
      ./yukari
      {home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."yukari";}
    ];
  };
  marisa = mkNixosSystem {
    extraModules = [
      ./marisa
      {home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."marisa";}
    ];
  };
  kaguya = mkNixosSystem {
    extraModules = [
      ./kaguya
      {home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."kaguya";}
    ];
  };
}
