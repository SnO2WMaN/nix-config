{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    # package = pkgs.firefox-wayland;
    profiles.default = {
      userChrome = (builtins.readFile ./userChrome.css);
      extraConfig = (builtins.readFile ./config.js);
    };
  };
  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DBUS_REMOTE = 1;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/ftp" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  };
}
