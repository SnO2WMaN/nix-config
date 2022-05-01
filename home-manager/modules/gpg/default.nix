{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gpg-tui
    pinentry-gtk2
  ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "gtk2";
  };
}
