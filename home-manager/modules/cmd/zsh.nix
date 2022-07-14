{
  config,
  pkgs,
  ...
}: let
  listgroups = pkgs.writeShellScriptBin "listgroups" "cat /etc/group | cut -d: -f1";
  listpath = pkgs.writeShellScriptBin "listpath" "echo $PATH | sed -e \"s/:/\\n/g\"";
in {
  imports = [
    ./bat.nix
    ./du-dust.nix
    ./hyperfine.nix
    ./lsd.nix
    ./neovim.nix
    ./procs.nix
    ./zellij.nix
  ];

  home.packages = with pkgs; [
    listgroups
    listpath
  ];

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

      cat = "${pkgs.bat}/bin/bat";
      dig = "${pkgs.dogdns}/bin/dog";
      du = "${pkgs.du-dust}/bin/dust";
      ls = "${pkgs.lsd}/bin/lsd";
      ps = "${pkgs.procs}/bin/procs";
      rm = "${pkgs.rm-improved}/bin/rip -i";
      miniserve = "${pkgs.miniserve}/bin/miniserve";
      time = "${pkgs.hyperfine}/bin/hyperfine";
      z = "${pkgs.zoxide}/bin/zoxide";
      ze = "${pkgs.zellij}/bin/zellij";
      vim = "${pkgs.neovim}/bin/nvim";
      imagemagick = "${pkgs.imagemagick}/bin/convert";

      lsgroups = "${listgroups}/bin/listgroups";
      lspath = "${listpath}/bin/listpath";
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

      # EMULATOR=$(cat /proc/$PPID/comm)
      # [[ $EMULATOR != "code" && $EMULATOR != "zellij" ]] && ${pkgs.zellij}/bin/zellij
    '';
  };
}
