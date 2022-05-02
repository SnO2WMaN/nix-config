final: prev: {
  nodePackages = prev.nodePackages // (import ./node2nix { pkgs = final; });
}
