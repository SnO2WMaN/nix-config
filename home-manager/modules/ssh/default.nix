{
  config,
  pkgs,
  ...
}: {
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     openssh = prev.openssh.overrideAttrs (old: {
  #       patches = (old.patches or []) ++ [./openssh.patch];
  #       doCheck = false;
  #     });
  #   })
  # ];

  programs.ssh = {
    enable = true;
    matchBlocks = with builtins; let
      identityFile = ["~/.ssh/id_ed25519"];
    in (
      listToAttrs
      (
        map
        (hostname: {
          name = hostname;
          value = {
            inherit identityFile;
            hostname = hostname;
            user = "sno2wman";
          };
        })
        ["reimu" "marisa" "yukari" "remilia" "kaguya" "koishi"]
      )
      // {
        "sumireko" = {
          inherit identityFile;
          hostname = "sumireko";
          user = "sno2wman";
          port = 2222;
        };
        "gitlab.sno2wman.net" = {
          inherit identityFile;
          hostname = "gitlab.sno2wman.net";
          user = "gitlab";
          port = 443;
        };
      }
    );
  };
}
