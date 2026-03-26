{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.amdgpu = {
    overdrive = {
      enable = true;
      ppfeaturemask = "0xffffffff";
    };
    initrd.enable = true; # Loads kernel module in stage 1
    opencl.enable = false;
  };
}
