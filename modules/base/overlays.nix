{
  self,
  nixpkgs-wayland,
  nixgl,
  useful-scripts,
  powercord-overlay,
  ...
}: {
  nixpkgs.overlays = [
    self.overlays.default
    nixpkgs-wayland.overlay
    nixgl.overlay
    powercord-overlay.overlay
  ];
}
