{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    android-studio
  ];
  home.sessionVariables = {
    ANDROID_SDK_ROOT = "${builtins.getEnv "HOME"}/Android/Sdk";
  };
  home.sessionPath = [
    "${builtins.getEnv "HOME"}/Android/Sdk/platform-tools"
    "${builtins.getEnv "HOME"}/.pub-cache/bin"
  ];
}
