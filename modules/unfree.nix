{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "1password"
      "android-studio-stable"
      "discord"
      "gitkraken"
      "google-chrome"
      "mongodb-compass"
      "slack"
      "spotify-unwrapped"
      "spotify"
      "steam"
      "steam-original"
      "vscode"
      "code"
      "minecraft-launcher"
      "discord-canary"
    ];
}
