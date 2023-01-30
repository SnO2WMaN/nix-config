{
  config,
  pkgs,
  ...
}: {
  services.easyeffects = {
    enable = true;
    preset = "dt770pro80";
  };

  xdg.configFile."easyeffects/output".source = ./output;
}
