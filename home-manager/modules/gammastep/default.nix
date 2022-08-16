{
  config,
  pkgs,
  ...
}: {
  services.gammastep = {
    enable = true;

    latitude = "36";
    longitude = "140";

    tray = true;

    temperature = {
      day = 5000;
      night = 4800;
    };

    settings = {
      general = {
        fade = 1;
      };
    };
  };
}
