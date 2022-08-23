{
  self,
  nixpkgs-wayland,
  nixgl,
  useful-scripts,
  ...
}: {
  nixpkgs.overlays = [
    self.overlays.default
    nixpkgs-wayland.overlay
    # nixgl.overlay TODO: fix when https://github.com/guibou/nixGL/issues/111
    useful-scripts.overlays.default
  ];
}
