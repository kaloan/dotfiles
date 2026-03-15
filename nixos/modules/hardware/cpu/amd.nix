{
  config,
  lib,
  pkgs,
  ...
}:

{
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd = {
    updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    microcodePackage = lib.mkDefault pkgs.microcode-amd;

    # Options only available for AMD EPYC CPUs regarding Secure Encrypted Virtualization (SEV), which encrypts parts of memory for virtual machines.
    sev = {

    };
    sevGuest = {

    };
  };
}
