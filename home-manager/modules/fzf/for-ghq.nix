{pkgs, ...}: {
  home.packages = [
    (
      pkgs.writeShellScriptBin
      "fzf_ghq"
      "ghq list -p | fzf --preview \"ls -p {}\""
    )
  ];
}
