{
  config,
  lib,
  pkgs,
  ...
}:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel = {
    updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    microcodePackage = lib.mkDefault pkgs.microcode-intel;

    # Options regarding Software Guard Extensions (SGX), which encrypts parts of memory for virtual machines.
    sgx = {

    };
  };
}
