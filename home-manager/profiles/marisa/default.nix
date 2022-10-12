{pkgs, ...}: {
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    networkmanagerapplet
    w3m
    slurp
  ];

  imports = [
    ../../modules
    ../../modules/1password
    ../../modules/chrome
    ../../modules/discord
    ../../modules/fcitx
    ../../modules/firefox
    ../../modules/gammastep
    ../../modules/gitkraken
    ../../modules/gscan2pdf
    ../../modules/gtk
    ../../modules/helvum
    ../../modules/kitty
    ../../modules/ristretto
    ../../modules/slack
    ../../modules/spotify
    ../../modules/ssh
    ../../modules/sway
    ../../modules/vscode
    ../../modules/waybar
    ../../modules/wl-clipboard
    ../../modules/wofi
  ];

  services.kanshi.profiles = {
    marisa = {
      outputs = [
        {
          criteria = "HDMI-A-1";
          position = "0,0";
          mode = "1920x1080";
        }
        {
          criteria = "eDP-1";
          position = "1920,0";
          mode = "1920x1080";
        }
      ];
    };
  };

  programs.ssh = {
    matchBlocks = let
      identityFile = ["/home/sno2wman/.ssh/id_ed25519"];
    in {
      remilia = {
        inherit identityFile;
        hostname = "remilia";
        user = "sno2wman";
      };
      ase-aleph = {
        inherit identityFile;
        hostname = "aleph";
        user = "sno2wman";
      };
    };
  };
}
