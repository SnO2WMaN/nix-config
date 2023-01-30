{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    cloudflared
  ];

  age.secrets."cloudflared-tunnels-yukari" = {
    file = ../../secrets/cloudflared/tunnels/yukari.age;
    owner = "cloudflared";
    group = "cloudflared";
  };

  services.cloudflared = {
    enable = true;
    tunnels = {
      "aaa40bb3-be10-4ae4-b215-2a5ae21e6ae3" = {
        default = "http_status:404";
        credentialsFile = config.age.secrets.cloudflared-tunnels-yukari.path;
        ingress = {
          "ssh-yukari.sno2wman.net" = "ssh://localhost:22";
        };
      };
    };
  };
}
