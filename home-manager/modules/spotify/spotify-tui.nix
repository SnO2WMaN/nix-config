{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./spotifyd.secret.nix
  ];

  home.packages = with pkgs; [
    spotify-tui
  ];

  services.spotifyd = {
    enable = true;
  };
}
