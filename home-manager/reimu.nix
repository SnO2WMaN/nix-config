{ config, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  imports = [
    ./modules/home-manager
    ./modules/miscellaneous

    ./modules/zsh
    ./modules/git
    ./modules/zellij
    ./modules/neovim
    ./modules/asdf-vm
    ./modules/ssh

    ./modules/fonts
    ./modules/gtk
    ./modules/alacritty
    ./modules/kitty
    ./modules/pcmanfm
    ./modules/ristretto
    ./modules/gscan2pdf

    ./modules/fcitx
    ./modules/firefox

    ./modules/sway
    # ./modules/sway/kanshi.nix
    # ./modules/sway/mako.nix
    # ./modules/sway/waybar.nix
    # ./modules/sway/wofi.nix
    ./modules/gammastep

    ./modules/1password
    ./modules/gitkraken
    ./modules/spotify
    ./modules/slack
    # ./modules/discord
    ./modules/vscode
  ];
}
