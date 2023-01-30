{
  config,
  pkgs,
  system,
  ...
}: { 
  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    xdg-utils
  ]; 

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs; 
  };
}
