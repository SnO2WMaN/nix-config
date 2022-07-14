{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
  };

  programs.git = {
    extraConfig = {
      core.editor = "${pkgs.neovim}/bin/nvim";
    };
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
}
