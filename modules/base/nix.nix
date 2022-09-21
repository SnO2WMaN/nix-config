{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      builders-use-substitutes = true
      keep-outputs = true
      keep-derivations = true
    '';
  };
  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };
  nix.settings = {
    max-jobs = lib.mkDefault 8;
    auto-optimise-store = true;
    trusted-users = ["root" "sno2wman"];
    substituters = ["https://cache.nixos.org/"];
  };
}
