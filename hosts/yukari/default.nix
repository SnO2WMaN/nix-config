{
  config,
  lib,
  pkgs,
  modulesPath,
  nixpkgs,
  nixos-hardware,
  ...
}: {
  imports =
    [
      ../../modules
      ../../modules/sound
      ../../modules/ssh
      ../../modules/sane
      ../../modules/desktop/sway
      ../../modules/develop/docker
      # ../../modules/develop/virtualbox
    ]
    ++ [
    ]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-amd
      common-gpu-amd
      common-pc-ssd
    ]);

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
  ];
  environment.variables.RADV_PERFTEST = "nggc";

  fileSystems."/" = {
    fsType = "ext4";
    device = "/dev/disk/by-label/nixos";
  };

  fileSystems."/boot" = {
    # device = "/dev/disk/by-uuid/C156-8E76";
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [
    {device = "/dev/disk/by-label/swap";}
  ];

  # Additional packages
  system.stateVersion = "22.05";

  # environment.systemPackages = with pkgs; [];

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
      # for sudo
      "wheel"
      # TODO: for ?
      "video"
      # docker
      "docker"
      "libvirtd"
      "kvm"
    ];
  };

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
    displayManager.sddm = {
      enable = true;
    };
  };
}
