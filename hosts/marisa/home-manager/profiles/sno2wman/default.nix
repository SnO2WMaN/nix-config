{pkgs, ...}: {
  home.stateVersion = "23.05";

  imports =
    [
      ../../../../../hm/bat
      ../../../../../hm/bottom
      ../../../../../hm/direnv
      ../../../../../hm/dogdns
      ../../../../../hm/exa
      ../../../../../hm/ghq
      ../../../../../hm/git
      ../../../../../hm/nix-index
      ../../../../../hm/starship
      ../../../../../hm/vim
      ../../../../../hm/zellij
      ../../../../../hm/ssh
      ../../../../../hm/zsh
      ../../../../../hm/vim
    ]
    # Desktop
    ++ [
      ../../../../../hm/1password
      ../../../../../hm/alacritty
      ../../../../../hm/chrome
      ../../../../../hm/pcmanfm
      ../../../../../hm/fcitx5
      ../../../../../hm/firefox
      ../../../../../hm/gitkraken
      ../../../../../hm/slack
      ../../../../../hm/vscode
    ]
    # Host-specific Desktop
    ++ [
      ../../modules/easyeffects
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
    cloudflared
  ];

  news.display = "silent";

  programs.ssh = {
    matchBlocks = {
      "yukari" = {
        hostname = "ssh-yukari.sno2wman.net";
        user = "sno2wman";
        proxyCommand = "cloudflared access ssh --hostname %h";
      };
      "remilia" = {
        hostname = "ssh-remilia.sno2wman.net";
        user = "sno2wman";
        proxyCommand = "cloudflared access ssh --hostname %h";
      };
    };
  };
}
