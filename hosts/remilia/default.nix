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
      ../../modules/ssh
    ]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-amd
      common-pc-ssd
    ]);

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [
    ];

    loader = {
      systemd-boot.enable = true;
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
  virtualisation.libvirtd.enable = true;

  powerManagement.cpuFreqGovernor = "performance";

  environment.systemPackages = with pkgs; [
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ef92c7d4-ad47-4806-a622-4f2abd562ca2";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DAAD-07F4";
    fsType = "vfat";
  };
  fileSystems."/mnt/backups" = {
    device = "akyu:/volume1/backups";
    fsType = "nfs";
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/0afb4061-d95c-49d8-b41e-6458a55ac11f";
    }
  ];

  # Additional packages
  system.stateVersion = "22.05";

  # environment.systemPackages = with pkgs; [];

  # Network
  networking = {
    hostName = "remilia";

    useDHCP = false;
    interfaces.enp1s0f1.useDHCP = true;
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
}
