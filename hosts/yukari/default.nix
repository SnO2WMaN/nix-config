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
      vscode-server.nixosModules.default
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
      ../../modules/lightdm.nix
      ../../modules/nix.nix
      ../../modules/sane.nix
      ../../modules/sound.nix
      ../../modules/sound.nix
      ../../modules/ssh.nix
      ../../modules/stylix.nix
      ../../modules/sudo.nix
      ../../modules/sway.nix
      ../../modules/time.nix
      ../../modules/unfree.nix
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

  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    file
    thefuck
    mc
    virt-manager
    lutris
    vulkan-tools
    wineWowPackages.stable
    mesa-demos
    bsnes-hd
    coreutils
  ];
  environment.variables.RADV_PERFTEST = "nggc";

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

  # TODO: GTK?
  programs.dconf = {enable = true;};
  services.dbus = {
    packages = with pkgs; [dconf];
  };

  users.users.sno2wman = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;
    extraGroups = [
      # TODO: for ?
      "video"
      # docker
      "docker"
      "libvirtd"
      "kvm"
      "wireshark"
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
	
  services.vscode-server = {
	enable = true;
  };

  system.stateVersion = "22.05";
}
