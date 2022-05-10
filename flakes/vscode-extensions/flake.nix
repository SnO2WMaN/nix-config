{
  description = "Nix flake for VSCode extensions";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };
  outputs = { ... }@inputs: {
    overlay = final: prev: {
      vscode-extensions = prev.vscode-extensions //
        /*
          builtins.listToAttrs (map
          (ext: {
          name = "${ext.publisher}.${ext.name}"; # it can't 
          value = final.vscode-utils.extensionFromVscodeMarketplace ext;
          })
          (import ./extensions.nix).extensions
          );
        */
        (import ./defaults.nix) ({
          inherit (final.vscode-utils) extensionFromVscodeMarketplace;
        });
    };
  };
}
