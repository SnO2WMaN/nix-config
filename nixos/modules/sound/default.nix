{ config, lib, pkgs, ... }:
{
  sound.enable = true;

  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
