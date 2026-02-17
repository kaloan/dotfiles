{
  config,
  pkgs,
  inputs,
  ...
}:

{
  networking = {
    networkmanager.enable = true; # Enables networking
    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    firewall = {
      enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };

    proxy = {
      # default = "http://user:password@proxy:port/";
      noProxy = "127.0.0.1,localhost"; # If you want to include a domain: "127.0.0.1,localhost,internal.domain"
    };
  };
}
