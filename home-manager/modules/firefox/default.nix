{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland.override {
      extraPrefs = ''
        user_pref("ui.key.menuAccessKeyFocuses", false);

        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", false);

        user_pref("browser.fullscreen.autohide", false);
        user_pref("browser.startup.homepage", "about:home");
        user_pref("browser.newtabpage.enabled", true);
        user_pref("browser.startup.page", 1);

        user_pref("extensions.screenshots.disabled", false);
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
