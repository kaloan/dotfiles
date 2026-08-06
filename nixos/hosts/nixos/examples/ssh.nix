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
    enableRecommendedAlgorithms = true;
    settings = {
      AllowUsers = null;
      DenyGroups = [ "wheel" ];
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    ports = [ ];
    # extraConfig is used to define your ~/.ssh/config file which is used by default to fill in information during login to defined hosts
    # extraConfig = ''
    #   Host lan-machine
    #     HostName 192.168.1.123
    #     Port 22
    #     User user-in-lan-machine
    #     IdentityFile ~/.ssh/private-key-used-to-login-user-in-lan-machine
    # '';
  };
}
