{ config
, pkgs
, ...
}: {
  imports = [
    ./starship.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    du-dust
  ];
}
