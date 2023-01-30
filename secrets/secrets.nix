let
  system.yukari = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINtSL9TwPQRUERassbIkL6CPdkBAUEqonDvv9h60HlF+ root@yukari";
  user.sno2wman = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net";
in {
  # "cloudflare-global-api-key.age".publicKeys = [system.yukari user.sno2wman];
  "cloudflared/tunnels/yukari.age".publicKeys = [system.yukari user.sno2wman];
}
