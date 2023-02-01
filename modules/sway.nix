{nixpkgs-wayland, ...}: {
  # nixpkgs.overlays = [
  #   nixpkgs-wayland.overlay
  # ];

  programs.sway = {
    enable = true;
  };
}
