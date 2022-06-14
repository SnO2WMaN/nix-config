{ config, pkgs, ... }:
let
  fzf_ghq = (
    pkgs.writeShellScriptBin
      "fzf_ghq"
      ''
        local src = $(ghq list -p | fzf --preview "ls -p {}")
        if [ -n "$src" ]; then
          cd $src
        fi
      ''
  );
in
{
  home.packages = [ fzf_ghq ];
}

