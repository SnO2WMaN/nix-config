{ config, pkgs, ... }:
{
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

    # signing = {
    #   key = "346DFF31CF021C4E390BEC749762915DF90A830A";
    #   signByDefault = true;
    # };

    aliases = {
      c = "commit --verbose";

      initc = "commit --allow-empty -m 'Initial Commit'";
    };
  };
}
