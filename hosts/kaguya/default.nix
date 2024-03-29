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
  imports =
    [
      ../../modules
      ../../modules/sound
      ../../modules/ssh
      ../../modules/sane
      ../../modules/desktop/sway
    ]
    ++ (with nixos-hardware.nixosModules; [
      common-cpu-intel
      common-pc-ssd
    ]);
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = ["xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod"];
  boot.initrd.kernelModules = [];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = ["kvm-intel"];

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

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    corectrl
    seatd
  ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  # Network
  networking = {
    hostName = "kaguya";

    useDHCP = false;
    interfaces.eno1.useDHCP = true;
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
}
