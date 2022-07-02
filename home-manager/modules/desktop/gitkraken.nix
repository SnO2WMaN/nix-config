{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    gitkraken
  ];

  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/gitkraken" = ["GitKraken.desktop"];
    };
  };
}
