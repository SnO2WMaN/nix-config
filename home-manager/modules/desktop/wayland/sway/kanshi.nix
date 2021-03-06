{
  config,
  pkgs,
  lib,
  ...
}: {
  services.kanshi = {
    enable = true;
    profiles = {
      yukari = {
        outputs = [
          {
            criteria = "DP-2";
            position = "0,0";
            mode = "1920x1080";
            transform = "270";
          }
          {
            criteria = "DP-1";
            position = "1200,0";
            mode = "2560x1080";
          }
          {
            criteria = "DP-3";
            position = "1200,1080";
            mode = "2560x1080";
          }
        ];
      };
      marisa = {
        outputs = [
          {
            criteria = "HDMI-A-1";
            position = "0,0";
            mode = "1920x1080";
          }
          {
            criteria = "eDP-1";
            position = "1920,0";
            mode = "1920x1080";
          }
        ];
      };
    };
  };
}
