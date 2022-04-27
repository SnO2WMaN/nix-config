{ config, pkgs, ... }:
{
  home.homeDirectory = builtins.getEnv "HOME";
  home.username = builtins.getEnv "USER";

  home.stateVersion = "22.05";

  imports = [
    ./common.nix

    ./1password
    ./alacritty
    ./fcitx
    ./firefox
    ./gammastep
    ./git
    ./gitkraken
    ./gscan2pdf
    ./gtk
    ./home-manager
    ./miscellaneous
    ./neovim
    ./pcmanfm
    ./ristretto
    ./spotify
    ./sway
    ./vscode
    ./zellij
    ./zsh
  ];

  home.packages = with pkgs; [
    lshw

    traceroute
    tcpdump
    lsof
    nmap
    findomain
    websocat
    wireguard-tools

    # shell play
    pipes-rs
    cbonsai
    cava # audio visualizer for console
    tty-clock

    noisetorch

    pavucontrol

    act # GitHub Actions Runner 
    dive # docker image tool 
    buf # Protobuf tool
    grpcurl # curl for gRPC 
    altair # GraphQL GUI 
    hadolint # linter for Dockerfile
    treefmt
    rustup

    imagemagick

    playerctl
  ];
}
