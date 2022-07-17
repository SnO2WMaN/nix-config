{ config, pkgs, lib, ... }:
{
  wayland.windowManager.sway.config = {
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
            ${pkgs.swayidle}/bin/swayidle -w \
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
    focus = {
      followMouse = false;
    };
    floating = {
      criteria = [
        { app_id = "pavucontrol"; }
        { app_id = "nm-connection-editor"; }
        { app_id = "pcmanfm"; }
        { app_id = "ristretto"; }
        { app_id = "zoom"; }
        { app_id = "org.larusstone.qtspim"; }
        { app_id = "org.fcitx.fcitx5-config-qt"; }
        { instance = "fontforge"; }
        { instance = "1password"; }
        { instance = "qpaeq"; }
      ];
    };
    keybindings =
      let
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
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume 0 +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume 0 -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
          "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        };
  };
}
