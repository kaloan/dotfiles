{
  config,
  pkgs,
  inputs,
  ...
}:

{
  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        # Enable TPM emulation.
        # INPORTANT: Required for virtualisation of Windows 11.
        swtpm.enable = false;
      };
    };

    spiceUSBRedirection.enable = true; # Enable USB redirection
  };
}
