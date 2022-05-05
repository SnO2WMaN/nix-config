{ config, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  imports = [
    ./modules/1password
    ./modules/alacritty
    ./modules/asdf-vm
    ./modules/fcitx
    # ./modules/firefox
    ./modules/fonts
    ./modules/gammastep
    ./modules/git
    ./modules/gitkraken
    ./modules/gscan2pdf
    ./modules/gtk
    ./modules/home-manager
    ./modules/kitty
    ./modules/miscellaneous
    ./modules/neovim
    ./modules/pcmanfm
    ./modules/ristretto
    ./modules/slack
    ./modules/ssh
    ./modules/sway
    ./modules/sway/kanshi.nix
    ./modules/sway/mako.nix
    ./modules/sway/waybar.nix
    ./modules/sway/wofi.nix
    ./modules/vscode
    ./modules/zellij
    ./modules/zsh
    # ./modules/discord
    # ./modules/spotify 
  ];

  services.spotifyd.settings.global.device_name = "reimu";
}
