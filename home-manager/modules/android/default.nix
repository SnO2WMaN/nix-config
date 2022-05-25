{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    android-tools
    android-studio
    nubank.dart
    nubank.flutter
    nubank.flutter-patch
  ];
  home.sessionVariables = {
    ANDROID_SDK_ROOT = "${builtins.getEnv "HOME"}/Android/Sdk";
  };
  home.sessionPath = [
    "${builtins.getEnv "HOME"}/Android/Sdk/platform-tools"
    "${builtins.getEnv "HOME"}/.pub-cache/bin"
  ];
  # programs.git.extraConfig.safe.directory = [ "${pkgs.flutter}" ];
}
