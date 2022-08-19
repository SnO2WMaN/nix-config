{pkgs, ...}: {
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    steam
    w3m
    slurp
  ];
  imports = [
    ../../modules
    ../../modules/1password
    ../../modules/alacritty
    ../../modules/android-studio
    ../../modules/chrome
    ../../modules/discord
    ../../modules/easyeffects
    ../../modules/fcitx
    ../../modules/firefox
    ../../modules/gammastep
    ../../modules/gitkraken
    ../../modules/gscan2pdf
    ../../modules/gtk
    ../../modules/helvum
    ../../modules/kitty
    ../../modules/mongodb-compass
    ../../modules/pcmanfm
    ../../modules/ristretto
    ../../modules/slack
    ../../modules/spotify
    ../../modules/ssh
    ../../modules/sway
    ../../modules/vscode
    ../../modules/waybar
    ../../modules/wofi
    ../../modules/wl-clipboard
    ../../modules/zathura
  ];

  services.kanshi.profiles = {
    yukari = {
      outputs = [
        {
          criteria = "DP-2";
          position = "0,0";
          mode = "1920x1080";
          transform = "270";
        }
        {
          criteria = "DP-1";
          position = "1200,0";
          mode = "2560x1080";
        }
        {
          criteria = "DP-3";
          position = "1200,1080";
          mode = "2560x1080";
        }
      ];
    };
  };
}
