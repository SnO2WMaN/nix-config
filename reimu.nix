{ config, pkgs, ... }:
{
  home.homeDirectory = builtins.getEnv "HOME";
  home.username = builtins.getEnv "USER";

  home.stateVersion = "22.05";

  nixpkgs.overlays = [
    (
      let rev = "688e5927e149f07c4f909c51716093aff9f21759"; in
      import "${builtins.fetchTarball "https://github.com/nix-community/nixpkgs-wayland/archive/${rev}.tar.gz" }/overlay.nix"
    )
  ];

  imports = [
    ./1password
    ./alacritty
    ./fonts
    ./gammastep
    ./gitkraken
    ./gtk
    ./home-manager
    ./miscellaneous
    ./pcmanfm
    ./ristretto
    ./spotify
    ./zellij

    ./sway/mako.nix
    ./sway/kanshi.nix
    ./sway/waybar.nix
    ./sway/wofi.nix

    ./zsh/starship.nix
  ];
}
