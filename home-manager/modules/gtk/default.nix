{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Quintom-Ink";
      package = pkgs.quintom-cursor-theme;
      size = 24;
    };
    font = {
      package = pkgs.noto-fonts-cjk;
      name = "Noto Sans CJK JP";
    };
    gtk3 = {
      extraConfig = {
        gtk-menu-images = true;
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
