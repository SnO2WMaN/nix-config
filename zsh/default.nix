{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
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
}
