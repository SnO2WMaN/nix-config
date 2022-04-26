{ config, ... }:
let
  pkgs = import
    (fetchTarball https://channels.nixos.org/nixos-21.11/nixexprs.tar.xz)
    { config.allowUnfree = true; };
in
{
  nixpkgs.config.allowUnfree = true;
  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    xdg-utils
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };
}
