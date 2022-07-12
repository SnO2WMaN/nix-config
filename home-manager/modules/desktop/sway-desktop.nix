{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox
    ./fonts.nix
    ./vscode
  ];
}
