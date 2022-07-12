{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    stateVersion = "22.05";
    username = "sno2wman";
    homeDirectory = "/home/sno2wman";
  };
  home.packages = with pkgs; [
    networkmanagerapplet
    slurp
  ];
  home.sessionVariables = {
    LC_ALL = "C";
    LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
  };

  imports = [
    ./modules/cmd
    ./modules/desktop/common.nix
    # ./modules/miscellaneous
    # ./modules/1password
    # ./modules/alacritty
    # ./modules/discord
    # ./modules/fcitx
    # ./modules/fonts
    # ./modules/gammastep
    # ./modules/gitkraken
    # ./modules/gtk
    # ./modules/kitty
    # ./modules/pcmanfm
    # ./modules/ristretto
    # ./modules/slack
    # ./modules/spotify/desktop.nix
    # ./modules/sway
    # ./modules/sway/kanshi.nix
    # ./modules/sway/mako.nix
    # ./modules/sway/waybar.nix
    # ./modules/sway/wofi.nix
  ];
}
