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
    url = "https://static.wikia.nocookie.net/aesthetics/images/4/41/Liminal5.webp";
    sha256 = "sha256-Wu+BnEtq/W2MoEcgzti8C/h7avdp2MK3myJWAHMCaJw=";
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
