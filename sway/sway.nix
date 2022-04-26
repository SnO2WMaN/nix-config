{ config, pkgs, lib, ... }:
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
        { command = "${pkgs.fcitx5}/bin/fcitx5 -rd"; }
        { command = "${pkgs.fcitx5}/bin/kanshi"; }
        { command = "${pkgs.gammastep}/bin/gammastep-indicator"; }
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
      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        lib.mkOptionDefault {
          "${modifier}+0" = "workspace number 10";
          "${modifier}+Shift+0" = "move container to workspace number 10";
          "${modifier}+Shift+Delete" = "kill";
          "${modifier}+F1" = "exec code";
          "${modifier}+F2" = "exec firefox";
          "${modifier}+P" = "exec pcmanfm";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
          "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
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
