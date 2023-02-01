{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    sudo
  ];

  users.users.sno2wman.extraGroups = [
    "wheel"
  ];
}
