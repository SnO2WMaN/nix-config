{
  description = "Nix flake for VSCode extensions";
  outputs = { ... }@inputs: {

    /*
      overlay = final: prev: {
      vscode-extensions = with final.vscode-utils; prev.vscode-extensions // {
      ahmadalli.vscode-nginx-conf = extensionFromVscodeMarketplace {
      name = "vscode-nginx-conf";
      publisher = "ahmadalli";
      version = "0.1.3";
      sha256 = "10z0him4kl9q6h1nip7d3dp9nv0a1dkh3x6zqc6nilfw959v3358";
      };
      };
      };
    */
    overlay = final: prev: {
      vscode-extensions = with final.vscode-utils;
        prev.vscode-extensions //
        builtins.listToAttrs (map
          (ext: { name = "${ext.publisher}.${ext.name}"; value = extensionFromVscodeMarketplace ext; })
          (import ./extensions.nix).extensions
        );
    };
  };
}
