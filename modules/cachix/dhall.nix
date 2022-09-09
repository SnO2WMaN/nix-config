{
  nix.settings = {
    substituters = [
      # "https://cache.dhall-lang.org"
      "https://dhall.cachix.org"
    ];
    trusted-public-keys = [
      # "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
    ];
  };
}
