{
  config,
  pkgs,
  ...
}: {
  home = {
    stateVersion = "22.05";
    username = "sno2wman";
    homeDirectory = "/home/sno2wman";
  };
  nixpkgs.config = {
    allowUnfree = true;
  };
  imports = [
    ./modules/cmd
    ./modules/desktop/1password.nix
    ./modules/desktop/alacritty.nix
    ./modules/desktop/common.nix
    ./modules/desktop/discord.nix
    ./modules/desktop/fcitx
    ./modules/desktop/firefox
    ./modules/desktop/fonts.nix
    ./modules/desktop/gtk.nix
    ./modules/desktop/helvum.nix
    ./modules/desktop/kitty.nix
    ./modules/desktop/pcmanfm.nix
    ./modules/desktop/ristretto.nix
    ./modules/desktop/spotify.nix
    ./modules/desktop/vscode
    ./modules/desktop/wayland/sway
    ./modules/ssh
  ];
}
