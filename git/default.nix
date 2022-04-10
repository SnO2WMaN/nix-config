{ config, pkgs, ... }:
{
  imports = [
    ./gh.nix
    ./ghq.nix
  ];
  programs.git = {
    enable = true;

    userName = "SnO2WMaN";
    userEmail = "me@sno2wman.net";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = "false";
      };
    };

    aliases = {
      c = "commit --verbose";

      initc = "commit --allow-empty -m 'Initial Commit'";
    };
  };
}
