{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    lsd
    procs
    pueue
    du-dust
    fd
    ripgrep

    neofetch
    psmisc

    curl
    httpie
    wget

    jq
    yq
    fzf
    skim

    cachix
    niv
    rnix-lsp
    nix-prefetch-github
  ];

  programs.bottom.settings = {
    flags = {
      color = "nord";
    };
  };
  programs.bat.config = {
    theme = "Nord";
  };
}
