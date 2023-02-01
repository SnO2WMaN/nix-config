{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    google-chrome
  ];
  home.sessionVariables = {
    CHROME_EXECUTABLE = "${pkgs.google-chrome}/bin/google-chrome-stable";
  };
}
