{
  inputs,
  pkgs,
  stylix,
  base16-schemes,
  ...
}: {
  imports = [
    stylix.nixosModules.stylix
  ];

  stylix.image = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/cat-milk/Anime-Girls-Holding-Programming-Books/master/Typescript/Chito_Saving_Burning_Mastering_Typescript.png";
    sha256 = "sha256-ImCrR4jm1+F1U2Hji8CSIgQn8P0o1Kw3HZ8xZiKgCFQ=";
  };
  # stylix.polarity = "dark";
  stylix.base16Scheme = "${base16-schemes}/nord.yaml";
  stylix.fonts = {
    serif = {
      package = pkgs.ipaexfont;
      name = "IPAexMincho";
    };
    sansSerif = {
      package = pkgs.ipaexfont;
      name = "IPAexGothic";
    };
    monospace = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
