{pkgs, ...}: {
  home.stateVersion = "23.05";

  imports =
    [
      ../../modules/bottom
      ../../modules/bat
      ../../modules/exa
      ../../modules/direnv
      ../../modules/dogdns
      ../../modules/ghq
      ../../modules/git
      ../../modules/starship
      ../../modules/zellij
      ../../modules/zsh
      ../../modules/vim
      ../../modules/nix-index
    ]
    # Sway / Wayland
    ++ [
      ../../modules/kanshi
      # ../../modules/mako
      ../../modules/sway
      # ../../modules/swaylock
      ../../modules/waybar
      ../../modules/gammastep
      ../../modules/wl-clipboard
    ]
    # Desktop
    ++ [
      ../../modules/alacritty
      ../../modules/1password
      ../../modules/easyeffects
      ../../modules/fcitx5
      ../../modules/firefox
      ../../modules/vscode
      ../../modules/gitkraken
    ];

  home.packages = with pkgs; [
    httpie
    masscan
    nmap
    doas
    prettyping
    tldr
    vlc
    duf
    tree # file dir
    fd # find for files
    pavucontrol # Pulseaudio controller
    hyperfine # benchmark
    discord
    spotify
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
