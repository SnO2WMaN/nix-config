{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    stateVersion = "22.05";
    username = "sno2wman";
    homeDirectory = "/home/sno2wman";
  };
  home.packages = with pkgs; [
    networkmanagerapplet
    w3m
    slurp
  ];

  imports = [
    ./modules/cmd
    ./modules/desktop/1password.nix
    ./modules/desktop/chrome
    ./modules/desktop/discord.nix
    ./modules/desktop/fcitx
    ./modules/desktop/firefox
    ./modules/desktop/fonts.nix
    ./modules/desktop/gitkraken.nix
    ./modules/desktop/gtk.nix
    ./modules/desktop/ristretto.nix
    ./modules/desktop/slack.nix
    ./modules/desktop/spotify.nix
    ./modules/desktop/wayland/sway
    ./modules/desktop/helvum.nix
    ./modules/desktop/gscan2pdf.nix
		./modules/desktop/kitty.nix
		./modules/desktop/vscode
    ./modules/ssh
    ./modules/gpg
    # ./modules/miscellaneous
    # ./modules/1password
    # ./modules/alacritty
    # ./modules/discord
    # ./modules/fcitx
    # ./modules/fonts
    # ./modules/gammastep
    # ./modules/gitkraken
    # ./modules/gtk
    # ./modules/kitty
    # ./modules/pcmanfm
    # ./modules/ristretto
    # ./modules/slack
    # ./modules/spotify/desktop.nix
    # ./modules/sway
    # ./modules/sway/kanshi.nix
    # ./modules/sway/mako.nix
    # ./modules/sway/waybar.nix
    # ./modules/sway/wofi.nix
  ];
}
