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
          libsForQt5.fcitx5-qt
          fcitx5-mozc
        ];
      };

      xdg.configFile."waybar/style.css".source =
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
      home.file.".local/share/fcitx5/themes/sno2wman/theme.conf".source =
        pkgs.writeText "theme.conf"
        ''
          [Metadata]
          Name=sno2wman
          Version=0.1
          Author=sno2wman
          ScaleWithDPI=True

          [InputPanel]
          # 字体
          Font=PlemolJP35 13
          # 非选中候选字颜色
          NormalColor=#81a1c1
          # 选中候选字颜色
          HighlightCandidateColor=#88c0d0
          # 高亮前景颜色(输入字符颜色)
          HighlightColor=#88c0d0
          # 输入字符背景颜色
          HighlightBackgroundColor=#434c5e
          #
          Spacing=3

          [InputPanel/TextMargin]
          # 候选字对左边距
          Left=10
          # 候选字对右边距
          Right=10
          # 候选字向上边距
          Top=6
          # 候选字向下边距
          Bottom=6

          [InputPanel/Background]
          Color=#434c5e

          [InputPanel/Background/Margin]
          Left=2
          Right=2
          Top=2
          Bottom=2

          [InputPanel/Highlight]
          Color=#4c566a

          [InputPanel/Highlight/Margin]
          # 高亮区域左边距
          Left=10
          # 高亮区域右边距
          Right=10
          # 高亮区域上边距
          Top=7
          # 高亮区域下边距
          Bottom=7

          [Menu]
          Font=PlemolJP35 10
          NormalColor=#eceff4
          #HighlightColor=#4c566a
          Spacing=3

          [Menu/Background]
          Color=#434c5e

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
          Color=#4c566a

          [Menu/Highlight/Margin]
          Left=10
          Right=10
          Top=5
          Bottom=5

          [Menu/Separator]
          Color=#2e3440

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
