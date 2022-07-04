{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./sway.nix
    ./mako
    ./kanshi.nix
    ./swaylock
  ];
}
