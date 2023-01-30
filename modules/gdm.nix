{...}: {
  services = {
    xserver = {
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
    };
  };
}
