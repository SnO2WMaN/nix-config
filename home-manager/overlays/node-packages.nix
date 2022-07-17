final: prev: let
  nodePackage = import ./node2nix {pkgs = final;};
in {
  nodePackages =
    prev.nodePackages
    // nodePackage
    // {
      md-to-pdf = nodePackage.md-to-pdf.override {
        buildInputs = [final.chromium];

        preInstallPhases = "skipPuppeteerDownload";
        skipPuppeteerDownload = ''
          export PUPPETEER_SKIP_DOWNLOAD=1
        '';
      };
    };
}
