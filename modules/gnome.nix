{pkgs, ...}: {
  services = {
    dbus.packages = [pkgs.dconf];
    udev.packages = [pkgs.gnome3.gnome-settings-daemon];

    xserver = {
      desktopManager.gnome3.enable = true;
    };
  };
}
