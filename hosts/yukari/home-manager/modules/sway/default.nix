{
  config,
  pkgs,
  lib,
  ...
}: let
  wofi_ghq =
    pkgs.writeShellScriptBin "wofi_ghq"
    ''
      choice=$(killall -q -e wofi || ghq list | wofi -i -b --dmenu --lines=10)
      [[ -n "$choice" ]] && code $(ghq root)/$choice
    '';
in {
  home.packages = with pkgs; [
    killall
    clipman
    wdisplays
    wf-recorder
    pavucontrol
    swayidle
    # swaylock-effects
    wf-recorder
    wl-clipboard
    clipman
    ghq
    # wev

    wofi_ghq
    sway-contrib.grimshot
    pcmanfm
    brightnessctl
  ];

  wayland.windowManager.sway = {
    enable = true;
    # package = pkgs.sway-unwrapped;
    wrapperFeatures.gtk = true;
    systemdIntegration = true;
    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
      export QT_QPA_PLATFORM="wayland;xcb"
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
    config = {
      modifier = "Mod4";

      terminal = "alacritty";

      menu = "killall -q -e wofi || wofi --show drun";

      startup = [
        {
          command = "fcitx5 -rd";
          always = true;
        }
        # TODO: mv to kanshi
        {
          command = "kanshi";
          always = true;
        }
        {command = "wl-paste -t text --watch clipman store";}
        {
          command = ''
            swayidle -w \
              timeout 1200 'swaymsg "output * dpms off"' \
              resume 'swaymsg "output * dpms on"'
          '';
        }
      ];
      bars = [
        # TODO: mv waybar
        {
          command = "waybar";
        }
      ];
      input = {
        "*" = {
          xkb_layout = "\"jp\"";
        };
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      output = {
        #  "*" = "bg #d8dee9 solid_color";
        #  "HDMI-A-1" = "pos 0 0 res 1920x1080";
        #  "eDP-1" = "pos 1920 0 res 1920x1080";
      };
      focus = {
        followMouse = false;
      };
      floating = {
        criteria = [
          {app_id = "pavucontrol";}
          {app_id = "nm-connection-editor";}
          {app_id = "pcmanfm";}
          {app_id = "ristretto";}
          {app_id = "zoom";}
          {app_id = "org.larusstone.qtspim";}
          {app_id = "org.fcitx.fcitx5-config-qt";}
          {instance = "fontforge";}
          {instance = "1password";}
          {instance = "qpaeq";}
        ];
      };
      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        lib.mkOptionDefault
        {
          "${modifier}+0" = "workspace number 10";
          "${modifier}+Shift+0" = "move container to workspace number 10";
          "${modifier}+Shift+Delete" = "kill";
          "${modifier}+g" = "exec --no-startup-id wofi_ghq";
          # "${modifier}+F1" = "exec ${pkgs.vscode}/bin/code";
          "${modifier}+F2" = "exec firefox";
          "${modifier}+P" = "exec pcmanfm";
          # "${modifier}+Shift+S" = "exec grimshot --notify save area $HOME/Pictures/ss/$(date \"+%s\").png";
          "${modifier}+Shift+S" = "exec grimshot --notify save area $HOME/Pictures/ss/$(date +\"%s\").png";
          "${modifier}+u" = "border none";
          "${modifier}+n" = "border normal";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        };
    };
  };

  programs.zsh.shellAliases = {
    gifrec = "wf-recorder -g \"$(slurp)\" -c gif -f \"$HOME/Pictures/ss/$(unixtime).gif\"";
    mp4rec = "wf-recorder -g \"$(slurp)\" -f \"$HOME/Pictures/ss/$(unixtime).mp4\"";
  };
}
