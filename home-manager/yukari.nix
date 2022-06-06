{ config, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  imports = [
    ./modules/1password
    ./modules/alacritty
    ./modules/android
    ./modules/asdf-vm
    ./modules/discord
    ./modules/chrome
    ./modules/dev
    ./modules/fcitx
    ./modules/firefox
    ./modules/fonts
    ./modules/gammastep
    ./modules/git
    ./modules/gitkraken
    ./modules/gpg
    ./modules/gscan2pdf
    ./modules/gtk
    ./modules/home-manager
    ./modules/kitty
    ./modules/miscellaneous
    ./modules/neovim
    ./modules/pcmanfm
    ./modules/ristretto
    ./modules/slack
    ./modules/sound
    ./modules/spotify
    ./modules/ssh
    ./modules/sway
    ./modules/vscode
    ./modules/zellij
    ./modules/zsh
  ];

  services.spotifyd.settings.global.device_name = "yukari";
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  home.packages = with pkgs; [
    steam
  ];
}
