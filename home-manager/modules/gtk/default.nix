{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Quintom-Ink";
      package = pkgs.quintom-cursor-theme;
      size = 24;
    };
    gtk3 = {
      extraConfig = {
        gtk-menu-images = true;
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-menu-images = true;
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
