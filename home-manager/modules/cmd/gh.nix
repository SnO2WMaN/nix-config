{
  config,
  pkgs,
  ...
}: {
  programs.gh = {
    enable = true;
    enableGitCredentialHelper = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };
}
