final: prev: {
  clean-emptydir = (import ./clean-emptydir.nix) {pkgs = final;};
  listgroups = (import ./listgroups.nix) {pkgs = final;};
  listpath = (import ./listpath.nix) {pkgs = final;};
}
