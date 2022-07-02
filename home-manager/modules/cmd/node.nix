{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nodejs
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
  ];
}
