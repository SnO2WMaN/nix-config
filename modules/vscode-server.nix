{vscode-server, ...}: {
  imports = [
    vscode-server.nixosModules.default
  ];

  services.vscode-server = {
    enable = true;
  };
}
