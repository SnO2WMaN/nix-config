{
  description = "Nix flake for PlemolJP";

  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = {flake-utils, ...} @ inputs:
    flake-utils.lib.eachDefaultSystem (system: rec {
    });
}
