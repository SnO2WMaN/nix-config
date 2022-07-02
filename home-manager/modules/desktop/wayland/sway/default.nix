{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./sway.nix
    ./mako/mako.nix
    ./kanshi.nix
    ./swaylock/swaylock.nix
  ];
}
