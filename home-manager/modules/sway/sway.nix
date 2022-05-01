{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    clipman
    wdisplays
    wl-clipboard
    wf-recorder
    pavucontrol
    swayidle
    # swaylock-effects
    wf-recorder
    wev
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway-unwrapped;
    wrapperFeatures.gtk = true;
    extraSessionCommands =
      ''
        export XDG_SESSION_TYPE = wayland
        export XDG_CURRENT_DESKTOP = sway

        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

        export _JAVA_AWT_WM_NONREPARENTING=1
      '';
    config = {
      modifier = "Mod4";
      terminal = "${pkgs.kitty}/bin/kitty";
      menu = "${pkgs.psmisc}/bin/killall -q -e ${pkgs.wofi}/bin/wofi || ${pkgs.wofi}/bin/wofi --show drun";
      startup = [
        { command = "${pkgs.fcitx5}/bin/fcitx5 -rd"; always = true; }
        { command = "${pkgs.kanshi}/bin/kanshi"; always = true; }
        { command = "${pkgs.wl-clipboard}/bin/wl-paste -t text --watch ${pkgs.clipman}/bin/clipman store"; }
        {
          command =
            ''
              swayidle -w \
                timeout 1200 'swaymsg "output * dpms off"' \
                resume 'swaymsg "output * dpms on"'
            '';
        }

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
          "${modifier}+Shift+S" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save area $HOME/Pictures/screenshots/$(date +\"%Y_%m_%d__%H_%M_%S\").png";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
          "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        };
    };
  };

  xdg.configFile."swaylock/config".source = ./swaylock/config;

  programs.zsh.shellAliases = {
    copy = "${pkgs.wl-clipboard}/bin/wl-copy";
  };
}
