{
  config,
  pkgs,
  inputs,
  ...
}:

{
  boot = {
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    kernelPackages = pkgs.linuxPackages_6_18; # Define specific linux kernel version as <major>_<minor> or pkgs.linuxPackages_latest for the latest one
  };
}
