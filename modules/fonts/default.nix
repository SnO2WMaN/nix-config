{pkgs, ...}: {
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono
      ipaexfont
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
          "IPAexMincho"
          "JetBrains Mono"
        ]; # [ "Noto Serif CJK JP" "Noto Serif" ];
        sansSerif = [
          "IPAexGothic"
          "JetBrains Mono"
        ]; # [ "Noto Sans CJK JP" "Noto Sans" ];
        monospace = [
          "JetBrains Mono"
        ];
      };
    };
  };
}
