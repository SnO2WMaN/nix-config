{ config, pkgs, ... }:
{
  imports = [
    ../miscellaneous/psmisc.nix
  ];

  home.packages = with pkgs; [
    clipman
    mako
    wdisplays
    wl-clipboard
    wf-recorder
    pavucontrol
    kanshi
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DBUS_REMOTE = 1;
  };
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "${pkgs.psmisc}/bin/killall -q wofi || ${pkgs.wofi}/bin/wofi --show drun";
      startup = [
        { command = "fcitx5 -rd"; }
        { command = "kanshi"; }
      ];
      bars = [
        { command = "${pkgs.waybar}/bin/waybar"; }
      ];
      input = {
        "*" = { xkb_layout = "\"jp\""; };
      };
      fonts = {
        names = [ "JetBrains Mono" ];
        size = 8.0;
      };
    };
  };

  xdg.configFile."waybar/config".source = ./waybar/config;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;

  xdg.configFile."wofi/config".source = ./wofi/config;
  xdg.configFile."wofi/style.css".source = ./wofi/style.css;

  xdg.configFile."mako/config".source = ./mako/config;

  xdg.configFile."kanshi/config".source = ./kanshi/config;
}
