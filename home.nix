{ config, pkgs, ... }:
{
  imports = [
    "${fetchTarball "https://github.com/mudrii/hmtst/tarball/54387d616d028d5b1883dd5fe9a0d2dd4de20a00"}/services/nixos-vscode-ssh-fix.nix"
  ];

  home.username = "sno2wman";
  home.homeDirectory = "/home/sno2wman";

  home.stateVersion = "21.05";

  home.language.base = "en_US.UTF-8";
  home.packages = with pkgs; [
    zellij
    ghq
    nixpkgs-fmt
    wl-clipboard
    mako
    alacritty
    dmenu
    waybar
    clipman
    ly
    # fonts
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    # fcitx
    # unfree
    _1password-gui
  ];

  fonts.fontconfig.enable = true;

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-configtool
      fcitx5-gtk
      fcitx5-mozc
      libsForQt5.fcitx5-qt
    ];
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
      export QT_QPA_PLATFORM=wayland

      export MOZ_ENABLE_WAYLAND=1;
      export MOZ_DBUS_REMOTE=1;
    '';
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      startup = [
        { command = "fcitx5 -rd"; }
        { command = "1password --silent"; }
      ];
      input = {
        "*" = { xkb_layout = "\"jp\""; };
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager = {
    enable = true;
  };

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

  programs.gh = {
    enable = true;
  };


  programs.fzf.enable = true;
  programs.exa.enable = true;
  programs.bat.enable = true;
  programs.jq.enable = true;
  programs.direnv.enable = true;

  programs.bottom = {
    enable = true;
  };

  programs.zsh = {
    enable = true;

    enableSyntaxHighlighting = true;

    shellAliases = {
      vim = "nvim";
      v = "vim";
      ls = "exa";
      cat = "bat";
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
      save = 100000;
      size = 100000;
    };

  };

  programs.starship = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      editorconfig-nvim
      nord-nvim
      vim-nix
      vim-airline
      vim-airline-themes
      fzf-vim
      vim-gitgutter
    ];
    extraConfig = ''
      colorscheme nord

      set number
      set ruler
      set cursorline
      set smartindent
      set laststatus=2
      set autoread

      set scrolljump=5
      set scrolloff=5
      set sidescrolloff=15
      set sidescroll=1

      syntax enable
    '';
  };

  programs.firefox = {
    enable = true;
  };


  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.75;
      font.normal.family = "JetBrains Mono";
    };
  };

  services.nixos-vscode-ssh-fix.enable = true;
}
