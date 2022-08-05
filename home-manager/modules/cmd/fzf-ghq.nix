{
  config,
  pkgs,
  ...
}: let
  fzf_ghq = (
    pkgs.writeShellScriptBin
    "fzf_ghq"
    "ghq list -p | fzf --preview \"ls -p {}\""
  );
in {
  home.packages = [fzf_ghq];
}
