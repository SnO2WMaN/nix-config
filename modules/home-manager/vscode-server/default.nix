{
  pkgs,
  config,
  vscode-server,
  ...
}: {
  config.home-manager.sharedModules = [
    vscode-server.nixosModules.home
    {
      services.vscode-server.enable = true;
    }
  ];
}
