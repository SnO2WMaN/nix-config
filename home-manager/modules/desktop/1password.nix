{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    _1password-gui
  ];

  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/onepassword" = ["1password.desktop"];
    };
  };
}
