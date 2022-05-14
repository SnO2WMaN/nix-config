{ config
, lib
, pkgs
, inputs
, modulesPath
, nixpkgs
, nixos-hardware
, flake-registry
, ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    nixos-hardware.nixosModules.common-cpu-intel
    nixos-hardware.nixosModules.common-pc-ssd

    ./modules/chrony
    ./modules/dm
    ./modules/networkmanager
    ./modules/nix
    ./modules/opengl
    ./modules/sane
    ./modules/sound
    ./modules/ssh
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "kvm-intel" ];

  boot.extraModulePackages = [ ];

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
    { device = "/dev/disk/by-label/swap"; }
  ];

  # Additional packages
  system.stateVersion = "21.11";

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
  programs.dconf = { enable = true; };
  services.dbus = {
    packages = with pkgs; [ dconf ];
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
