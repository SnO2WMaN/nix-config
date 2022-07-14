{
  config,
  pkgs,
  lib,
  ...
}: let
  killall = "${pkgs.psmisc}/bin/killall";
  wofi = "${pkgs.wofi}/bin/wofi";

  ghq = "${pkgs.ghq}/bin/ghq";

  code = "code";

  wofi_ghq =
    pkgs.writeShellScriptBin "wofi_ghq"
    ''
      choice=$(${killall} -q -e ${wofi} || ${ghq} list | ${wofi} -i -b --dmenu --lines=10)
      [[ -n "$choice" ]] && ${code} $(${ghq} root)/$choice
    '';
in {
  imports = [
    ../../vscode
    ../../alacritty.nix
    ../../pcmanfm.nix

    ../waybar
    ../wofi
    ../gammastep.nix
    ../wl-clipboard.nix
  ];

  home.packages = with pkgs; [
    clipman
    wdisplays
    wf-recorder
    pavucontrol
    swayidle
    # swaylock-effects
    wf-recorder
    # wev

    wofi_ghq
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
      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.psmisc}/bin/killall -q -e ${pkgs.wofi}/bin/wofi || ${pkgs.wofi}/bin/wofi --show drun";
      startup = [
        {
          command = "${pkgs.fcitx5}/bin/fcitx5 -rd";
          always = true;
        }
        {
          command = "${pkgs.kanshi}/bin/kanshi";
          always = true;
        }
        {command = "${pkgs.wl-clipboard}/bin/wl-paste -t text --watch ${pkgs.clipman}/bin/clipman store";}
        {
          command = ''
            ${pkgs.swayidle}/bin/swayidle -w \
              timeout 1200 'swaymsg "output * dpms off"' \
              resume 'swaymsg "output * dpms on"'
          '';
        }
      ];
      bars = [
        {command = "${pkgs.waybar}/bin/waybar";}
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
      fonts = {
        names = ["JetBrains Mono"];
        size = 8.0;
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
          "${modifier}+F1" = "exec ${pkgs.vscode}/bin/code";
          "${modifier}+F2" = "exec ${pkgs.firefox}/bin/firefox";
          "${modifier}+P" = "exec ${pkgs.pcmanfm}/bin/pcmanfm";
          "${modifier}+Shift+S" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify save area $HOME/Pictures/screenshots/$(date +\"%Y_%m_%d__%H_%M_%S\").png";
          "${modifier}+u" = "border none";
          "${modifier}+n" = "border normal";
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
          "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        };
    };
  };

  xdg.configFile."swaylock/config".source = ./swaylock/config;
}
