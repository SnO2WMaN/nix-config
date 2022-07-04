{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gscan2pdf
  ];
}
