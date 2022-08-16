(final: prev: {
  openssh = prev.openssh.overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./openssh/permissions.patch
      ];
    doCheck = false;
  });
})
