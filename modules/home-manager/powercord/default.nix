{
  pkgs,
  config,
  powercord-overlay,
  ...
}:
with config.lib.stylix.colors.withHashtag;
with config.stylix.fonts; {
  config.home-manager.sharedModules = [
    {
      home.packages = with pkgs; [
        (discord-plugged.override {
          # nss = pkgs.nss_latest;
          themes = [
            (builtins.fetchTarball "https://github.com/Dyzean/Tokyo-Night/archive/master.tar.gz")
          ];
        })
      ];
    }
  ];
}
