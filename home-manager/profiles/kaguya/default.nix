{pkgs, ...}: {
  home.stateVersion = "22.05";
  imports = [
    ../../modules
    ../../modules/1password
    ../../modules/alacritty
    ../../modules/discord
    ../../modules/fcitx
    ../../modules/firefox
    ../../modules/gammastep
    ../../modules/gtk
    ../../modules/helvum
    ../../modules/kitty
    ../../modules/pcmanfm
    ../../modules/ristretto
    ../../modules/spotify
    ../../modules/ssh
    ../../modules/sway
    ../../modules/vscode
    ../../modules/waybar
    ../../modules/wl-clipboard
    ../../modules/wofi
  ];
}
