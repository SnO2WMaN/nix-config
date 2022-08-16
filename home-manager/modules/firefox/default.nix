{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland.override {
      extraPrefs = ''
        lockPref("ui.key.menuAccessKeyFocuses", false);

        lockPref("toolkit.legacyUserProfileCustomizations.stylesheets", false);


        lockPref("browser.fullscreen.autohide", false);
        lockPref("browser.startup.homepage", "about:home");
        lockPref("browser.newtabpage.enabled", true);
        lockPref("browser.startup.page", 1);

        lockPref("extensions.screenshots.disabled", false);
      '';
      extraPolicies = {
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };
      };
    };
    profiles.default = {
      userChrome = builtins.readFile ./userChrome.css;
    };
  };
  home.sessionVariables = {
    BROWSER = "firefox";
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DBUS_REMOTE = 1;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/ftp" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
    };
  };
}
