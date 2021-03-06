{
  config,
  lib,
  pkgs,
  inputs,
  modulesPath,
  nixpkgs,
  nixos-hardware,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    nixos-hardware.nixosModules.common-cpu-amd
    nixos-hardware.nixosModules.common-pc-ssd

    # ./modules/android
    ./modules/chrony
    ./modules/dm
    ./modules/docker
    ./modules/networkmanager
    ./modules/nix
    ./modules/opengl
    # ./modules/sane
    ./modules/sound
    ./modules/fonts
    # ./modules/ssh
    # ./modules/virtualbox
  ];
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

  # Additional packages
  system.stateVersion = "21.11";

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    corectrl
    seatd
    ly
    openssl
    sudo
    home-manager
  ];

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

  users.users.sno2wman = {
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;
    extraGroups = [
      # for sudo
      "wheel"
      # TODO: for ?
      "video"
    ];
  };

  services.tlp = {
    enable = true;
    settings = {
      USB_EXCLUDE_PHONE = 1;
    };
  };

  programs.sway = {enable = true;};
}
