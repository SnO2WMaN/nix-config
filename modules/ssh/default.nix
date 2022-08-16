{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.firewall.allowedTCPPorts = config.services.openssh.ports;

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    ports = [22];
  };

  users.users.sno2wman = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net"
    ];
  };
}
