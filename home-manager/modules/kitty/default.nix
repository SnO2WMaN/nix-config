{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
		theme = "Nord";
		font = {
			name = "JetBrains Mono";
			size = 10;
		};
  };
}
