{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    xfce.ristretto
    xfce.tumbler
  ];
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = ["org.xfce.ristretto.desktop"];
      "image/jpg" = ["org.xfce.ristretto.desktop"];
      "image/gif" = ["org.xfce.ristretto.desktop"];
      "image/bmp" = ["org.xfce.ristretto.desktop"];
    };
  };
}
