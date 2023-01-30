{pkgs, ...}: {
  home.stateVersion = "23.05";

  imports =
    [
      ../../modules/bottom
      ../../modules/direnv
      ../../modules/dogdns
      ../../modules/ghq
      ../../modules/git
      ../../modules/starship
      ../../modules/zellij
      ../../modules/zsh
    ]
    # Sway
    ++ [
      ../../modules/kanshi
      ../../modules/mako
      ../../modules/sway
      ../../modules/swaylock
      ../../modules/waybar
    ]
    # Desktop
    ++ [
      ../../modules/alacritty
      ../../modules/fcitx5
      ../../modules/firefox
      ../../modules/vscode
    ];

  home.packages = with pkgs; [
    httpie
    masscan
    nmap
    doas
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
