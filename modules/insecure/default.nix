{...}: {
  nixpkgs.config.permittedInsecurePackages = [
    "libdwarf-20181024"
  ];
}
