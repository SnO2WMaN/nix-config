{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    ghq
  ];

  programs.git = {
    extraConfig = {
      ghq = {
        root = "~/src/ghq";
      };
    };
  };
}
