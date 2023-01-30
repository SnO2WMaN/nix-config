{...}: {
  programs.git = {
    enable = true;
    config = {
      safe.directory = ["/etc/nixos"];
    };
  };
}
