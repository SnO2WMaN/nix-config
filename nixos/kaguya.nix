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

  nix = {
    package = pkgs.nixFlakes;
    extraOptions =
      ''
        experimental-features = nix-command flakes
        flake-registry = ${flake-registry}
      '';

    nixPath = [ "nixpkgs=${nixpkgs}" ];

    # Storage optimize
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  # Network  
  networking = {
    hostName = "kaguya";

    useDHCP = false;
    interfaces.eno1.useDHCP = true;

    networkmanager = { enable = true; };
  };

  # NTP (Clock)
  time.timeZone = "Asia/Tokyo";
  services.chrony = { enable = true; };
  networking.timeServers = [
    "0.jp.pool.ntp.org"
    "1.jp.pool.ntp.org"
    "2.jp.pool.ntp.org"
    "3.jp.pool.ntp.org"
  ];

  # OpenGL
  hardware.opengl = {
    enable = true;
    package = pkgs.mesa_drivers;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # TODO: GTK?
  programs.dconf = { enable = true; };
  services.dbus = {
    packages = with pkgs; [ dconf ];
  };

  # Sane (Scanner / Printer)
  hardware.sane.enable = true;

  # Docker
  # virtualisation.docker = { enable = true; };

  # VirtualBox
  # virtualisation.virtualbox.host = {
  #   enable = true;
  #   enableExtensionPack = true;
  # };

  # SSH
  networking.firewall.allowedTCPPorts = [ ] ++ config.services.openssh.ports;
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    ports = [ 22 ];
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
      # for NetworkManager
      "networkmanager"
      # for Docker
      "docker"
      # for Sane
      "scanner"
      "lp"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net"
    ];
  };
}
