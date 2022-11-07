{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = false;

    shellAliases = {
      # Shortener / Replacement
      clip = "copy";
      d = "docker";
      dc = "docker compose";
      drill = "dig";
      g = "git";
      serve = "miniserve";
      v = "vim";
      wq = "wg-quick";

      # human friendly
      cp = "cp -i";
      df = "df -h";
      free = "free -m";

      # ls
      l = "clear && l";
      ll = "ls -alF";
      la = "ls -a";
      lt = "ls -T";
      l1 = "ls -1";

      # cat = "bat";
      dig = "dog";
      du = "dust";
      # ls = "lsd";
      ps = "procs";
      rm = "rip -i";
      miniserve = "miniserve";
      time = "hyperfine";
      z = "zoxide";
      ze = "zellij";
      vim = "nvim";

      lsgroups = "listgroups";
      lspath = "listpath";

      rm-ext = "remove-extensions";

      cn = "tr -d \"\n\"";

      unixtime = "date +\"%s\"";
    };

    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-completions";}
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-history-substring-search";}
        {name = "zdharma-continuum/fast-syntax-highlighting";}
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

      function fzf-ghq () {
        local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
        if [ -n "$selected_dir" ]; then
          BUFFER="cd ''${selected_dir}"
          zle accept-line
        fi
        zle clear-screen
      }
      zle -N fzf-ghq
      bindkey '^g' fzf-ghq
    '';
  };
}
