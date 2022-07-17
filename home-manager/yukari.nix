{
  config,
  pkgs,
  ...
}: {
  home = {
    stateVersion = "22.05";
    username = "sno2wman";
    homeDirectory = "/home/sno2wman";
  };

  home.packages = with pkgs; [
    steam
    w3m
    slurp
  ];

  imports = [
    ./modules/cmd
    ./modules/desktop/1password.nix
    ./modules/desktop/alacritty.nix
    ./modules/desktop/android-studio.nix
    ./modules/desktop/chrome
    ./modules/desktop/common.nix
    ./modules/desktop/discord.nix
    ./modules/desktop/easyeffects.nix
    ./modules/desktop/fcitx
    ./modules/desktop/firefox
    ./modules/desktop/fonts.nix
    ./modules/desktop/gitkraken.nix
    ./modules/desktop/gscan2pdf.nix
    ./modules/desktop/gtk.nix
    ./modules/desktop/helvum.nix
    ./modules/desktop/kitty.nix
    ./modules/desktop/pcmanfm.nix
    ./modules/desktop/ristretto.nix
    ./modules/desktop/slack.nix
    ./modules/desktop/spotify.nix
    ./modules/desktop/vscode
    ./modules/desktop/wayland/sway
    ./modules/desktop/wayland/waybar/waybar.nix
    ./modules/desktop/wayland/wofi/wofi.nix
    ./modules/desktop/wayland/gammastep.nix
    ./modules/desktop/wayland/wl-clipboard.nix
    ./modules/ssh
  ];
}
