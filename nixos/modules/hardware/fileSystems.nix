{
  config,
  lib,
  pkgs,
  ...
}:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-partlabel/root"; # "/dev/sda2" "/dev/disk/by-uuid/bce91df6-77a0-44e6-b319-ca74b6e127de"
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-partlabel/EFI"; # "/dev/sda1" "/dev/disk/by-uuid/535C-7C5E"
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  # Swap can reduce virtual memory device lifespan
  swapDevices = [ ];
}
