{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    theme = "Nord";
    font = {
      size = 9;
    };
    settings = {
      enable_audio_bell = false;
    };
  };
}
