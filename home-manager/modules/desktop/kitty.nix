{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    theme = "Nord";
    font = {
      name = "JetBrains Mono";
      size = 9;
    };
    settings = {
      enable_audio_bell = false;
    };
  };
}
