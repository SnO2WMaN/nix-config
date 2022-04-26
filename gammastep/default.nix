{ config, pkgs, ... }:
{
  services.gammastep = {
    enable = true;

    latitude = "36";
    longitude = "140";

    tray = true;
  };
}
