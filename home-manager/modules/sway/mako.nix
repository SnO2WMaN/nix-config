{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [mako];

  xdg.configFile."mako/config".source = ./mako/config;
}
