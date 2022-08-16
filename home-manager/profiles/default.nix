inputs: let
  inherit (inputs) self;
  homeImports = {
    "yukari" = [
      ./yukari
    ];
  };
in {
  inherit homeImports;
}
