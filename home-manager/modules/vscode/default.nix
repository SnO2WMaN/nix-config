{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    xdg-utils
  ];

  home.sessionVariables = {
    # NIXOS_OZONE_WL = "1";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      # johnsoncodehk.volar  
      # ms-toolsai.jupyter
      # ms-toolsai.jupyter-renderers
      # rust-lang.rust
      ahmadalli.vscode-nginx-conf
      alefragnani.bookmarks
      arcticicestudio.nord-visual-studio-code
      arrterian.nix-env-selector
      avli.clojure
      bradlc.vscode-tailwindcss
      christian-kohler.path-intellisense
      dbaeumer.vscode-eslint
      denoland.vscode-deno
      dhall.dhall-lang
      dhall.vscode-dhall-lsp-server
      dprint.dprint
      editorconfig.editorconfig
      eg2.vscode-npm-script
      esbenp.prettier-vscode
      exiasr.hadolint
      file-icons.file-icons
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
      github.vscode-pull-request-github
      golang.go
      graphql.vscode-graphql
      hashicorp.terraform
      haskell.haskell
      james-yu.latex-workshop
      jkillian.custom-local-formatters
      jnoortheen.nix-ide
      jroesch.lean
      leanprover.lean4
      ms-azuretools.vscode-docker
      ms-python.python
      ms-python.vscode-pylance
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      nimsaem.nimvscode
      prisma.prisma
      redhat.vscode-xml
      redhat.vscode-yaml
      richie5um2.vscode-sort-json
      styled-components.vscode-styled-components
      tamasfe.even-better-toml
      timonwong.shellcheck
      visualstudioexptteam.vscodeintellicode
    ];
    userSettings = {
      editor = {
        formatOnSave = true;

        fontFamily = "'Jetbrains Mono'";
        fontLigatures = false;
        fontSize = 12;
        fontWeight = "normal";

        suggestSelection = "first";

        bracketPairColorization.enabled = true;
        minimap.enabled = false;
      };
      explorer = {
        confirmDragAndDrop = false;
      };
      workbench = {
        colorTheme = "Nord";
        iconTheme = "file-icons";

        sideBar.location = "right";

        tree.indent = 12;
      };
      terminal.integrated = {
        fontFamily = "'Jetbrains Mono'";
        fontSize = 10;
        rightClickBehavior = "paste";
      };
      files.associations = {
        ".renovaterc" = "jsonc";
      };
      git = {
        autofetch = true;
        confirmSync = false;
      };
      javascript = {
        updateImportsOnFileMove.enabled = true;
      };
      typescript = {
        updateImportsOnFileMove.enabled = true;
      };
      redhat = {
        telemetry.enabled = false;
      };
      latex-workshop = {
        view.pdf.viewer = "browser";
      };
      nix = {
        formatterPath = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
      };
      dprint = {
        path = "${pkgs.dprint}/bin/dprint";
      };
      vscode-dhall-lsp-server = {
        executable = "${pkgs.dhall-lsp-server}/bin/dhall-lsp-server";
      };
      "[json]" = {
        editor.defaultFormatter = "vscode.json-language-features";
      };
      "[jsonc]" = {
        editor.defaultFormatter = "vscode.json-language-features";
      };
      "[nix]" = {
        editor.defaultFormatter = "jnoortheen.nix-ide";
      };
      "[dhall]" = {
        editor.defaultFormatter = "dhall.vscode-dhall-lsp-server";
      };
    };
  };
}
