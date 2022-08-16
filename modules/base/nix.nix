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
    '';
  };
  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };
  nix.settings = {
    max-jobs = lib.mkDefault 4;
    auto-optimise-store = true;
    substituters = ["https://cache.nixos.org/"];
  };
}
