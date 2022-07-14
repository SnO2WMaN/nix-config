{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox
    ./chrome
    ./fonts.nix
    ./vscode
    ./gtk.nix
    ./fcitx
    ./gitkraken.nix
    ./wayland/sway
  ];
}
