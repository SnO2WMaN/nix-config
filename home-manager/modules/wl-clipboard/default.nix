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
    copy = "${pkgs.wl-clipboard}/bin/wl-copy";
  };
}
