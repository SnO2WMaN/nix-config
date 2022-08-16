{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    imagemagick
  ];

  programs.zsh.shellAliases = {
    imagemagick = "${pkgs.imagemagick}/bin/convert";
  };
}
