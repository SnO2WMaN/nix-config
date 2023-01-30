inputs: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs.lib) nixosSystem;
in {
  yukari = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      ./yukari
    ];
  };

  marisa = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      ./marisa
    ];
  };
  /*
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
  */
}
