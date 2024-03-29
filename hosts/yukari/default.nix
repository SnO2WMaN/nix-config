{
  config,
  lib,
  pkgs,
  nixpkgs,
  nixos-hardware,
  home-manager,
  vscode-server,
  agenix,
  ...
}: {
  imports =
    [
      nixpkgs.nixosModules.notDetected
      home-manager.nixosModules.home-manager
      agenix.nixosModules.age
    ]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-amd
      common-gpu-amd
      common-pc-ssd
    ])
    ++ [
      ../../modules/docker.nix
      ../../modules/git.nix
      ../../modules/home-manager.nix
      ../../modules/i18n.nix
      ../../modules/insecure.nix
      ../../modules/sddm.nix
      ../../modules/nix.nix
      ../../modules/overlays.nix
      ../../modules/sane.nix
      ../../modules/sound.nix
      ../../modules/ssh.nix
      ../../modules/stylix
      ../../modules/sudo.nix
      ../../modules/sway.nix
      # ../../modules/gdm.nix
      # ../../modules/gnome.nix
      ../../modules/time.nix
      ../../modules/unfree.nix
      ../../modules/vscode-server.nix
    ]
    ++ [
      ./cloudflared.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [
      "kvm-amd"
      "v4l2loopback"
    ];

    extraModulePackages = with pkgs; [
      config.boot.kernelPackages.v4l2loopback.out
    ];

    loader = {
      systemd-boot.enable = true;
      # grub = {
      #   enable = true;
      #   version = 2;
      #   device = "nodev";
      #   efiSupport = true;
      #   configurationLimit = 10;
      # };
      efi.canTouchEfiVariables = true;
    };

    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];

    binfmt.emulatedSystems = [
      "aarch64-linux"
    ];
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.systemPackages = with pkgs; [
    coreutils
    wget
    vim
  ];
  /*
  environment.variables.RADV_PERFTEST = "nggc";
  */

  fileSystems."/" = {
    fsType = "ext4";
    device = "/dev/disk/by-uuid/bfcfcbee-349a-4a6a-99d8-cf8b177fd97f";
  };

  fileSystems."/boot" = {
    fsType = "vfat";
    device = "/dev/disk/by-uuid/72B2-C236";
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/61c91ca4-b7dc-4aab-91ac-ed6cd59e52a1";
    }
  ];

  # Network
  networking = {
    hostName = "yukari";

    useDHCP = false;
    interfaces.enp3s0.useDHCP = true;
  };

  /*
  # TODO: GTK?
  programs.dconf = {enable = true;};
  services.dbus = {
    packages = with pkgs; [dconf];
  };
  */

  users.users.sno2wman = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;
    extraGroups = [
      /*
      # TODO: for ?
      "video"
      # docker
      "docker"
      "libvirtd"
      "kvm"
      "wireshark"
      */
    ];
  };
  home-manager.users.sno2wman = import ./home-manager/profiles/sno2wman;

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [mesa.drivers];
  };

  services.xserver = {
    enable = true;
    videoDrivers = [
      "amdgpu"
      "radeon"
    ];
  };

  nix.buildMachines = [
    {
      hostName = "remilia";
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "i686-linux"
      ];
      sshUser = "nix-builder";
      sshKey = "/etc/ssh/ssh_host_ed25519_key";
      maxJobs = 24;
      speedFactor = 4;
      supportedFeatures = [
        "nixos-test"
        "benchmark"
        "big-parallel"
        "kvm"
      ];
      mandatoryFeatures = [];
    }
  ];

  system.stateVersion = "22.05";
}
