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
    libreoffice

    # shell play
    pipes-rs
    cbonsai
    cava # audio visualizer for console
    tty-clock

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
