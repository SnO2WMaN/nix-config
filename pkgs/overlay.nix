(final: prev: {
  openssh = prev.openssh.overrideAttrs (old: {
    patches =
      (old.patches or [])
      ++ [
        ./openssh/permissions.patch
      ];
    doCheck = false;
  });

  clean-emptydir = final.callPackage ./clean-emptydir {};
  listgroups = final.callPackage ./listgroups {};
  listpath = final.callPackage ./listpath {};
  remove-extensions = final.callPackage ./remove-extensions {};
})
