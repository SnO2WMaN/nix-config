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
      ahmadalli.vscode-nginx-conf
      alefragnani.Bookmarks
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
      EditorConfig.EditorConfig
      eg2.vscode-npm-script
      esbenp.prettier-vscode
      exiasr.hadolint
      file-icons.file-icons
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
      GitHub.vscode-pull-request-github
      golang.go
      GraphQL.vscode-graphql
      hashicorp.terraform
      James-Yu.latex-workshop
      jnoortheen.nix-ide
      jroesch.lean
      leanprover.lean4
      ms-azuretools.vscode-docker
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-ssh-edit
      nimsaem.nimvscode
      Prisma.prisma
      redhat.vscode-xml
      redhat.vscode-yaml
      richie5um2.vscode-sort-json
      styled-components.vscode-styled-components
      timonwong.shellcheck
      VisualStudioExptTeam.vscodeintellicode
    ];
    userSettings = {
      editor = {
        formatOnSave = true;

        fontFamily = "'Jetbrains Mono'";
        fontLigatures = true;
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
      "[jsonc]" = {
        editor.defaultFormatter = "vscode.json-language-features";
      };
    };
  };
}
