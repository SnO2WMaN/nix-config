{ config, pkgs, lib, ... }:
{
  home.homeDirectory = builtins.getEnv "HOME";
  home.username = builtins.getEnv "USER";

  home.stateVersion = "22.05";

  nixpkgs.overlays = [
    (
      let rev = "688e5927e149f07c4f909c51716093aff9f21759"; in
      import "${builtins.fetchTarball "https://github.com/nix-community/nixpkgs-wayland/archive/${rev}.tar.gz" }/overlay.nix"
    )
  ];

  imports = [
    ./home-manager
    ./miscellaneous
    ./asdf-vm
    ./zellij

    ./pcmanfm
    ./ristretto

    ./1password
    ./gitkraken
    ./spotify

    ./git/ghq.nix
    ./git/git.nix

    ./zsh/starship.nix
  ];

  home.packages = with pkgs; [
    # nettools
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

    # dev tools
    act # GitHub Actions Runner 
    dive # docker image tool 

    buf # Protobuf tool
    grpcurl # curl for gRPC 

    altair # GraphQL GUI 

    hadolint # linter for Dockerfile
    treefmt

    rustup

    imagemagick
  ];
}
