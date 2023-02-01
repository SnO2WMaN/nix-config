{
  config,
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-configtool
      fcitx5-gtk
      fcitx5-mozc
      libsForQt5.fcitx5-qt
    ];
  };

  # xdg.configFile."fcitx5/conf/classicui.conf".source = ./classicui.conf;

  home.file.".local/share/fcitx5/themes/Nord-Dark" = {
    source = ./Nord-Dark;
    recursive = true;
  };
}
