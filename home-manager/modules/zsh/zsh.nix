{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    shellAliases = {
      g = "git";
      v = "vim";

      z = "${pkgs.zoxide}/bin/zoxide";
      ze = "${pkgs.zellij}/bin/zellij";
      serve = "${pkgs.miniserve}/bin/miniserve";

      # human friendly
      cp = "cp -i";
      df = "df -h";
      free = "free -m";

      # ls
      ll = "ls -alF";
      la = "ls -a";
      lt = "ls -T";
      l1 = "ls -1";

      # compatible
      drill = "dig";
      vim = "${pkgs.neovim}/bin/nvim";

      # replacement
      ls = "${pkgs.lsd}/bin/lsd";
      cat = "${pkgs.bat}/bin/bat";
      du = "${pkgs.du-dust}/bin/dust";
      ps = "${pkgs.procs}/bin/procs";
      rm = "${pkgs.rm-improved}/bin/rip -i";
      dig = "${pkgs.dogdns}/bin/dog";
      time = "${pkgs.hyperfine}/bin/hyperfine";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-history-substring-search"; }
        { name = "zdharma-continuum/fast-syntax-highlighting"; }
      ];
    };

    history = {
      extended = true;
      share = false;
      save = 100000;
      size = 100000;
    };

    initExtra = ''
      bindkey '^[[A' history-substring-search-up # Up
      bindkey '^[[B' history-substring-search-down # Down
      bindkey '^[[D' backward-char # Left
      bindkey '^[[C' forward-char # Right

      bindkey '^[[1;2D' backward-word
      bindkey '^[[1;2C' forward-word

      bindkey '^[Od' backward-word # Ctrl+Left
      bindkey '^[Oc' forward-word # Ctrl+Right
      bindkey '^H' backward-kill-word # Ctrl+Backspace

      bindkey '^[[2~' overwrite-mode # Insert
      bindkey '^[[3~' delete-char # Delete
      bindkey '^[[5~' history-beginning-search-backward # PgUp
      bindkey '^[[6~' history-beginning-search-forward # PgDn
      bindkey '^[[7~' beginning-of-line # Home
      bindkey '^[[8~' end-of-line # End
      bindkey '^[[H' beginning-of-line
      bindkey '^[[F' end-of-line
      bindkey '^[[Z' undo # Shift+Tab 
    '';
  };
}
