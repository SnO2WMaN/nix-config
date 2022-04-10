{ config, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
      export QT_QPA_PLATFORM=wayland

      export MOZ_ENABLE_WAYLAND=1;
      export MOZ_DBUS_REMOTE=1;
    '';
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "killall -q wofi || wofi --show drun";
      startup = [];
      input = {
        "*" = { xkb_layout = "\"jp\""; };
      };
    };
  };

  xdg.configFile."wofi/config".source = ./wofi/config;
  xdg.configFile."wofi/style.css".source = ./wofi/style.css;
}
