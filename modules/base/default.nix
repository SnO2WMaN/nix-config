{pkgs, ...}: {
  imports = [
    ./nix.nix
    ./overlays.nix
    ./hm-system-defaults.nix
  ];
  console.font = "7x14";

  environment.systemPackages = with pkgs; [
    binutils
    bottom
    corectrl
    curl
    direnv
    git
    git-crypt
    home-manager
    iputils
    jq
    ly
    moreutils
    openssl
    seatd
    sudo
    vim
    wget
  ];

  programs.command-not-found = {
    enable = true;
  };
  programs.git = {
    enable = true;
    config = {
      safe.directory = ["/etc/nixos"];
    };
  };
}
