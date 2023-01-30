inputs: let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs.lib) nixosSystem;
  /*
  mkNixosSystem = {extraModules ? []}:
    nixosSystem {
      system = "x86_64-linux";
      specialArgs = inputs;
      modules = extraModules ++ commonModules;
    };
  */
in {
  yukari = nixosSystem {
    system = "x86_64-linux";
    specialArgs = inputs;
    modules = [
      ./yukari
    ];
    /*
    extraModules = [
      ./yukari
      {home-manager.users.sno2wman = (import "${self}/home-manager/profiles")."yukari";}
    ];
    */
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
