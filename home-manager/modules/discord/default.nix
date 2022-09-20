{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (discord.overrideAttrs
      (oa: rec {
        version = "0.0.20";
        srcs = fetchurl {
          url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
          sha256 = "sha256-3f7yuxigEF3e8qhCetCHKBtV4XUHsx/iYiaCCXjspYw=";
        };
      }))
  ];
}
