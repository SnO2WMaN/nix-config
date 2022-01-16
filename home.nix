{ config, pkgs, ... }:
{
	home.username = "sno2wman";
  	home.homeDirectory = "/home/sno2wman";

	home.stateVersion = "21.05";

	home.language.base = "en_US.UTF-8";
	home.packages = [
		pkgs.zellij
		pkgs.ghq
    	];

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

                aliases = {
                  c = "commit --verbose";

                  initc = "commit --allow-empty -m 'Initial Commit'";
          };
        };

        programs.gh = {
          enable = true;
        };


        programs.exa.enable = true;
        programs.bat.enable = true;
        programs.jq.enable = true;

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
		];
		extraConfig = ''
			colorscheme nord

                        set title
                        set number
                        set ruler
                        set cursorline
                        set smartindent
                        set laststatus=2
                        set autoread

                        syntax enable
		'';
	};
	
}
