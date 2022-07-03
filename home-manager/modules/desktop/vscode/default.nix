{
  config,
  pkgs,
  ...
}: {
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
    package = pkgs.vscode-fhs;
    # extensions = with pkgs.vscode-extensions; [
    #   # johnsoncodehk.volar
    #   # ms-toolsai.jupyter-renderers
    #   # rust-lang.rust
    #   ahmadalli.vscode-nginx-conf
    #   alefragnani.bookmarks
    #   arcticicestudio.nord-visual-studio-code
    #   arrterian.nix-env-selector
    #   avli.clojure
    #   bradlc.vscode-tailwindcss
    #   christian-kohler.path-intellisense
    #   # dart-code.dart-code
    #   # dart-code.flutter
    #   dbaeumer.vscode-eslint
    #   denoland.vscode-deno
    #   dhall.dhall-lang
    #   dhall.vscode-dhall-lsp-server
    #   dprint.dprint
    #   editorconfig.editorconfig
    #   eg2.vscode-npm-script
    #   esbenp.prettier-vscode
    #   exiasr.hadolint
    #   file-icons.file-icons
    #   formulahendry.auto-close-tag
    #   formulahendry.auto-rename-tag
    #   # fwcd.kotlin
    #   github.vscode-pull-request-github
    #   golang.go
    #   graphql.vscode-graphql
    #   hashicorp.terraform
    #   haskell.haskell
    #   james-yu.latex-workshop
    #   jkillian.custom-local-formatters
    #   jnoortheen.nix-ide
    #   jroesch.lean
    #   leanprover.lean4
    #   ms-azuretools.vscode-docker
    #   ms-python.python
    #   ms-python.vscode-pylance
    #   # ms-toolsai.jupyter
    #   ms-vscode-remote.remote-containers
    #   ms-vscode-remote.remote-ssh
    #   ms-vscode-remote.remote-ssh-edit
    #   nimsaem.nimvscode
    #   prisma.prisma
    #   redhat.vscode-xml
    #   redhat.vscode-yaml
    #   richie5um2.vscode-sort-json
    #   styled-components.vscode-styled-components
    #   tamasfe.even-better-toml
    #   timonwong.shellcheck
    #   visualstudioexptteam.vscodeintellicode
    # ];
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

        codeActionsOnSave = {
          "source.fixAll.eslint" = true;
        };
      };
      explorer = {
        confirmDragAndDrop = false;
      };
      debug = {
        console.fontSize = 12;
      };
      workbench = {
        colorTheme = "Nord";
        iconTheme = "file-icons";

        sideBar.location = "right";
        startupEditor = "none";

        tree.indent = 12;
      };
      terminal.integrated = {
        fontFamily = "'Jetbrains Mono'";
        fontSize = 10;
        rightClickBehavior = "paste";
        commandsToSkipShell = [
          "language-julia.interrupt"
        ];
      };
      files.associations = {
        ".renovaterc" = "jsonc";
      };
      git = {
        autofetch = true;
        confirmSync = false;
      };
      javascript = {
        updateImportsOnFileMove.enabled = "always";
      };
      typescript = {
        updateImportsOnFileMove.enabled = "always";
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
      diffEditor = {
        ignoreTrimWhitespace = false;
      };
      dprint = {
        path = "${pkgs.dprint}/bin/dprint";
      };
      dart = {
        checkForSdkUpdates = false;
      };
      vscode-dhall-lsp-server = {
        executable = "${pkgs.dhall-lsp-server}/bin/dhall-lsp-server";
      };
      eslint = {
        enable = true;
      };
      julia = {
        enableTelemetry = false;
        symbolCacheDownload = true;
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
      "[dart]" = {
        editor.selectionHighlight = false;
        editor.suggest.snippetsPreventQuickSuggestions = false;
        editor.suggestSelection = "first";
        editor.tabCompletion = "onlySnippets";
        editor.wordBasedSuggestions = false;
      };
      "[prisma]" = {
        editor.defaultFormatter = "Prisma.prisma";
      };
    };
  };
}
