{ config, lib, pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    package = pkgs.mesa_drivers;
    driSupport = true;
    driSupport32Bit = true;
  };
}
