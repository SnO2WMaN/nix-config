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
    ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
    initrd.kernelModules = [];

    kernelParams = ["amdgpu.freesync_video=1" "amd_iommu=on" "pcie_aspm=off"];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-amd"];

    extraModulePackages = [];
  };

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
  networking = {
    hostName = "marisa";

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
      "wheel"
      "networkmanager"
    ];
  };
}
