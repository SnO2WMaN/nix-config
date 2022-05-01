{ config, pkgs, ... }: {
  programs.ssh = {
    enable = true;
    matchBlocks =
      with builtins;
      let identityFile = [ "~/.ssh/id_ed25519" ]; in
      (
        listToAttrs
          (map
            (hostname: { name = hostname; value = { inherit identityFile; hostname = hostname; user = "sno2wman"; }; })
            [ "reimu" "marisa" "yukari" "remilia" "kaguya" ]
          ) //
        listToAttrs
          (map
            (hostname: { name = hostname; value = { inherit identityFile; hostname = hostname; user = "root"; }; })
            [ "remilia" ]
          ) // {
          "gitlab.sno2wman.net" = {
            hostname = "gitlab.sno2wman.net";
            user = "gitlab";
            port = 443;
          };
        }
      );
  };
}
