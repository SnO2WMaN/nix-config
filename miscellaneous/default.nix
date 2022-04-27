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
    bottom

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
    nixpkgs-fmt
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
