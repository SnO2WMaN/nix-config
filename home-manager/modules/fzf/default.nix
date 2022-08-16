{pkgs, ...}: {
  home.packages = with pkgs; [
    fzf
  ];
  imports = [
    ./for-ghq.nix
  ];
}
