{ config, pkgs, ... }:
{
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
      menu = "killall -q wofi || wofi --show drun";
      startup = [ ];
      bars = [
        { command = "waybar"; }
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

  home.packages = with pkgs; [
    clipman
    mako
    wl-clipboard
    wf-recorder
    pavucontrol
  ];
}
