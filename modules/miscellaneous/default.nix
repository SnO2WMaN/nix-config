{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    lsd
    procs
    pueue
    du-dust
    fd
    ripgrep
    hexyl
    hyperfine
    fd

    neofetch
    psmisc

    curl
    httpie
    wget

    tree
    file
    binutils

    jq
    yq
    fzf
    skim

    cachix
    niv
    rnix-lsp
    nix-prefetch-github
    nixpkgs-fmt

    libreoffice

    # nettools
    traceroute
    tcpdump
    lsof
    nmap
    findomain
    websocat
    wireguard-tools
    ethtool
    smartmontools # hdd monitor 

    # dev tools
    act # GitHub Actions Runner 
    dive # docker image tool 
    buf # Protobuf tool
    grpcurl # curl for gRPC 
    altair # GraphQL GUI 
    hadolint # linter for Dockerfile
    treefmt # unified formatter
    shellcheck
    git-crypt
    rustup

    # shell play
    pipes-rs
    cbonsai
    cava # audio visualizer for console
    tty-clock

    android-studio

    imagemagick

    qt5ct

    gnupg
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
    };
  };

  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        color = "nord";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.command-not-found.enable = true;
  programs.dircolors.enable = true;
}
