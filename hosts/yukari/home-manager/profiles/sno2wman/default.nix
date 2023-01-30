{pkgs, ...}: {
  home.stateVersion = "23.05";

  imports =
    [
      ../../modules/bat
      ../../modules/bottom
      ../../modules/direnv
      ../../modules/dogdns
      ../../modules/exa
      ../../modules/ghq
      ../../modules/git
      ../../modules/nix-index
      ../../modules/starship
      ../../modules/vim
      ../../modules/zellij
      ../../modules/zsh
    ]
    # Sway / Wayland
    ++ [
      ../../modules/gammastep
      ../../modules/kanshi
      ../../modules/sway
      ../../modules/waybar
      ../../modules/wl-clipboard
      # ../../modules/mako
      # ../../modules/swaylock
    ]
    # Desktop
    ++ [
      ../../modules/1password
      ../../modules/alacritty
      ../../modules/chrome
      ../../modules/easyeffects
      ../../modules/pcmanfm
      ../../modules/fcitx5
      ../../modules/firefox
      ../../modules/gitkraken
      ../../modules/slack
      ../../modules/vscode
    ];

  home.packages = with pkgs; [
    discord
    doas
    duf
    fd # find for files
    httpie
    hyperfine # benchmark
    masscan
    nmap
    pavucontrol # Pulseaudio controller
    prettyping
    spotify
    tldr
    tree # file dir
    vlc 
    fzf
  ];

  news.display = "silent";

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
