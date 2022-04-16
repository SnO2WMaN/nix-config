{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    shellAliases = {
      g = "git";
      v = "vim";

      ze = "zellij";

      vim = "nvim";

      # replacement
      ls = "lsd";
      cat = "bat";
      du = "dust";
      ps = "procs";
      rm = "rip";
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
