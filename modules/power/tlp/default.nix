{...}: {
  services.tlp = {
    enable = true;
    settings = {
      USB_EXCLUDE_PHONE = 1;
    };
  };
}
