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
    nixgl.overlay
    useful-scripts.overlays.default
  ];
}
