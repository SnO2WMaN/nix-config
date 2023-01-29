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
      ../../modules/desktop/lightdm
      ../../modules/desktop/sway
      ../../modules/develop/docker
      # ../../modules/develop/virtualbox
      ../../modules/home-manager/fcitx
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
      "wireshark"
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
  };
}
