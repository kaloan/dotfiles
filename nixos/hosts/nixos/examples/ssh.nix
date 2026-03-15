{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  services.openssh = lib.mkDefault {
    enable = true;
  };
}
