{ config, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  imports = [
    ./modules/home-manager
    ./modules/miscellaneous
    ./modules/asdf-vm
    ./modules/zellij
    ./modules/neovim

    ./modules/pcmanfm
    ./modules/ristretto

    ./modules/gtk

    ./modules/gammastep

    ./modules/1password
    ./modules/gitkraken
    ./modules/spotify
    ./modules/slack

    ./modules/git/ghq.nix
    ./modules/git/git.nix

    ./modules/zsh/starship.nix
  ];
}
