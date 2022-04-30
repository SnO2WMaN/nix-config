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
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # James-Yu.latex-workshop
      # johnsoncodehk.volar  
      # ms-vscode-remote.remote-containers
      # ms-vscode-remote.remote-ssh
      # ms-vscode-remote.remote-ssh-edit 
      # Prisma.prisma
      # redhat.vscode-xml
      # redhat.vscode-yaml 
      # richie5um2.vscode-sort-json
      # styled-components.vscode-styled-components
      # timonwong.shellcheck
      # VisualStudioExptTeam.vscodeintellicode
      ahmadalli.vscode-nginx-conf
      alefragnani.Bookmarks
      arcticicestudio.nord-visual-studio-code
      arrterian.nix-env-selector
      bradlc.vscode-tailwindcss
      dbaeumer.vscode-eslint
      denoland.vscode-deno
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
      jnoortheen.nix-ide
      ms-azuretools.vscode-docker
      ms-python.python
      ms-python.vscode-pylance
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
    ];
    userSettings = {
      editor = {
        formatOnSave = true;

        fontFamily = "'Jetbrains Mono'";
        fontLigatures = true;
        fontSize = 12;
        fontWeight = "normal";
      };
      workbench = {
        colorTheme = "Nord";
        iconTheme = "file-icons";
        sideBar.location = "right";
      };
      terminal.integrated = {
        fontFamily = "'Jetbrains Mono'";
      };
      redhat.telemetry.enabled = false;
      "[jsonc]" = {
        editor.defaultFormatter = "vscode.json-language-features";
      };
    };
  };
}
