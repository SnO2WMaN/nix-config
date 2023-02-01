{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    wl-clipboard
  ];

  programs.zsh.shellAliases = {
    copy = "wl-copy";
    clip = "wl-copy";
  };
}
