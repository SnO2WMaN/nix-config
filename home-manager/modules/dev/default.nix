{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs;
    [
      # nixops
      tree
      file
      binutils
      jq
      curl
      httpie
      wget
      psmisc
      gnumake
      yq
      fzf
      skim #fzf in rust
      act # GitHub Actions Runner
      altair # GraphQL GUI
      buf # Protobuf tool
      gcc
      cachix
      direnv
      dive # docker image tool
      ethtool
      findomain
      git-crypt
      grpcurl # curl for gRPC
      hadolint # linter for Dockerfile
      lsof
      niv
      nix-prefetch-github
      nixopsUnstable #nixops v2 beta
      nixpkgs-fmt
      nmap
      rnix-lsp
      rustup
      shellcheck
      smartmontools # hdd monitor
      tcpdump
      traceroute
      treefmt # unified formatter
      websocat
      wireguard-tools
      nodejs
      deno
      unzip
      kotlin
      go
      gotools
      gopls
      go-outline
      gocode
      gopkgs
      gocode-gomod
      godef
      golint
      mongodb-compass
    ]
    ++ (
      with pkgs.nodePackages; [
        node2nix

        npm
        yarn
        pnpm

        # zenn-cli
        # vercel
        # md-to-pdf
        # (vsce.overrideAttrs (old: {
        #   buildInputs = old.buildInputs;
        # }))
      ]
    );

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };
}
