{...}: {
  programs.starship = {
    enable = true;
    settings = {
      # format = "$shell$shlvl@$directory$character";
      # add_newline = true;

      # shell = {
      #   disabled = false;
      # };

      # shlvl = {
      #   disabled = false;
      #   symbol = "shlvl ";
      #   format = "on [$symbol$shlvl]($style)";
      # };

      # character = {
      #   success_symbol = "[>](bold green)";
      #   error_symbol = "[>](bold red)";
      # };

      # nix_shell.format = "via [$name]($style) ";

      directory = {
        truncation_length = 2;
        truncate_to_repo = true;
      };

      time = {
        disabled = false;
        utc_time_offset = "+9";
      };
    };
  };
}
