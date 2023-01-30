{pkgs, ...}: {
  home.stateVersion = "23.05";

  imports =
    [
      ../../modules/bottom
      ../../modules/dogdns
      ../../modules/direnv
      ../../modules/ghq
      ../../modules/git
      ../../modules/starship
      ../../modules/zellij
      ../../modules/zsh
      ../../modules/fcitx5
      ../../modules/firefox
    ]
    ++ [
      ../../modules/sway
      ../../modules/swaylock
      ../../modules/waybar
      ../../modules/kanshi
      ../../modules/mako
    ];

  home.packages = with pkgs; [
    httpie
    masscan
    nmap
    doas
  ];
}
