{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      time = {
        disabled = false;
        utc_time_offset = "+9";
      };
    };
  };
}
