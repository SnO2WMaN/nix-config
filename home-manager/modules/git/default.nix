{pkgs, ...}: {
  programs.git = {
    enable = true;

    userName = "SnO2WMaN";
    userEmail = "me@sno2wman.net";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        symlinks = "true";
      };
      pull = {
        rebase = "false";
      };
      fetch = {
        prune = "true";
      };
      ghq = {
        root = "~/src/ghq";
      };
    };

    delta = {
      enable = true;
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
