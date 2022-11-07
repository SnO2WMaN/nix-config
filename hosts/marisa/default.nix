{
  config,
  lib,
  pkgs,
  inputs,
  modulesPath,
  nixpkgs,
  nixos-hardware,
  vscode-server,
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
      ../../modules/network/networkmanager
      ../../modules/power/tlp
      ../../modules/home-manager/vscode-server
    ]
    ++ [
      vscode-server.nixosModules.default
    ]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-amd
      common-pc-ssd
      common-gpu-amd
    ]);
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [];

  boot.kernelParams = ["amdgpu.freesync_video=1" "amd_iommu=on" "pcie_aspm=off"];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = ["kvm-amd"];

  boot.extraModulePackages = [];

  powerManagement.cpuFreqGovernor = "performance";

  fileSystems."/" = {
    fsType = "ext4";
    device = "/dev/disk/by-label/nixos";
  };

  fileSystems."/boot" = {
    fsType = "vfat";
    device = "/dev/disk/by-label/boot";
  };

  swapDevices = [
    {device = "/dev/disk/by-label/swap";}
  ];

  environment.systemPackages = with pkgs; [];

  # Network
  networking.hostName = "marisa";
  networking = {
    useDHCP = false;
    interfaces.enp2s0.useDHCP = true;
    interfaces.wlp4s0.useDHCP = true;
  };

  # TODO: GTK?
  programs.dconf = {enable = true;};
  services.dbus = {
    packages = with pkgs; [dconf];
  };

  services.vscode-server.enable = true;

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net"
    ];
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
      "networkmanager"
    ];
  };

  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
    };
  };
}
