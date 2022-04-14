{ config, pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   nordic
  # ];
  gtk = {
    enable = true;
    # theme = {
    #   name = "Nordic-darker";
    # };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
