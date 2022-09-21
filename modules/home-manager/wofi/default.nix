{
  pkgs,
  config,
  ...
}:
with config.lib.stylix.colors.withHashtag;
with config.stylix.fonts; {
  # Referenced https://github.com/stacyharper/base16-mako
  config.home-manager.sharedModules = [
    {
      home.packages = with pkgs; [wofi];
      xdg.configFile."wofi/config".source =
        pkgs.writeText "config"
        ''
          allow_images=true
          allow_markup=true

          insensitive=true

          lines=7

          no_actions=true

          term=alacritty
          width=600
        '';
      xdg.configFile."wofi/style.css".source =
        pkgs.writeText "style.css"
        ''
          #entry:selected {
            background-color: ${base03};
            color: ${base00};
          }

          #input {
            border: none;
            border-radius: 0px;
          }

          #text {
            margin-left: 1em;
          }

          window {
            opacity: 0.75;
            border: 2px solid ${base00};
            background-color: ${base01};
            color: ${base06};
            border-radius: 5px;
          }
        '';
    }
  ];
}
