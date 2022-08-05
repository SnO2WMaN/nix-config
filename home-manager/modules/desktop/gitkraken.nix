{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    (gitkraken.overrideAttrs (old: let
      version = "8.7.0";
      srcs = {
        x86_64-linux = fetchzip {
          url = "https://release.axocdn.com/linux/GitKraken-v${version}.tar.gz";
          sha256 = "sha256-+Q6sw+V/+tdBaKmR3l0ARq7Z3h/yu06af4PtG2JESgQ=";
        };
      };
    in {
      inherit version;
      src = srcs.${pkgs.stdenv.hostPlatform.system};
    }))
  ];

  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/gitkraken" = ["GitKraken.desktop"];
    };
  };
}
