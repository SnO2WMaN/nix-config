{
  config,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (
      let
        rev = "688e5927e149f07c4f909c51716093aff9f21759";
      in
        import "${builtins.fetchTarball "https://github.com/nix-community/nixpkgs-wayland/archive/${rev}.tar.gz"}/overlay.nix"
    )
  ];
}
