{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      forceWayland = true;
      extraPolicies = {
        ExtensionSettings = { };
      };
    };
    profiles.default = {
      userChrome = (builtins.readFile ./userChrome.css);
      extraConfig = (builtins.readFile ./config.js);
    };
  };
  home.sessionVariables = {
    BROWSER = "firefox";
    DEFAULT_BROWSER = "firefox";
  };
}
