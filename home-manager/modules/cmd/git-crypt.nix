{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    git-crypt
  ];
}
