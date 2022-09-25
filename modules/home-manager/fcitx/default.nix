{
  config,
  pkgs,
  lib,
  ...
}:
with config.lib.stylix.colors.withHashtag;
with config.stylix.fonts; {
  config.home-manager.sharedModules = [
    {
      i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-configtool
          fcitx5-gtk
          fcitx5-mozc
          libsForQt5.fcitx5-qt
        ];
      };

      xdg.configFile = {
        "fcitx5/conf/classicui.conf".source =
          pkgs.writeText "classicui.conf"
          ''
            # Vertical Candidate List
            Vertical Candidate List=True

            # Use Per Screen DPI
            PerScreenDPI=True

            # Font
            # Font="PlemolJP35 10"
            # Menu Font
            # MenuFont="PlemolJP35 10"
            # Use input method language to display text
            UseInputMethodLangaugeToDisplayText=True

            # Theme
            Theme=sno2wman
          '';
      };

      home.file.".local/share/fcitx5/themes/sno2wman/theme.conf".source =
        pkgs.writeText "theme.conf"
        ''
          [Metadata]
          Name=sno2wman
          Version=0.1
          Author=sno2wman
          ScaleWithDPI=True

          [InputPanel]
          Font=PlemolJP35 13
          NormalColor=${base04}
          HighlightCandidateColor=${base05}
          HighlightColor=${base00}
          HighlightBackgroundColor=${base01}
          Spacing=3

          [InputPanel/TextMargin]
          Left=10
          Right=10
          Top=6
          Bottom=6

          [InputPanel/Background]
          Color=${base02}

          [InputPanel/Background/Margin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [InputPanel/Highlight]
          Color=${base03}

          [InputPanel/Highlight/Margin]
          Left=10
          Right=10
          Top=7
          Bottom=7

          [Menu]
          Font=PlemolJP35 10
          NormalColor=${base05}
          #HighlightColor=#4c566a
          Spacing=3

          [Menu/Background]
          Color=${base03}

          [Menu/Background/Margin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [Menu/ContentMargin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [Menu/Highlight]
          Color=${base03}

          [Menu/Highlight/Margin]
          Left=10
          Right=10
          Top=5
          Bottom=5

          [Menu/Separator]
          Color=${base01}

          [Menu/CheckBox]
          Image=radio.png

          [Menu/SubMenu]
          Image=arrow.png

          [Menu/TextMargin]
          Left=5
          Right=5
          Top=5
          Bottom=5
        '';
    }
  ];
}
