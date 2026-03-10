{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  networking = {
    networkmanager = {
      enable = true; # Enables networking
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    firewall = {
      enable = true;
      trustedInterfaces = [ "virbr0" ]; # Default interface for virtualisation
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };

    proxy = {
      # default = "http://user:password@proxy:port/";
      noProxy = "127.0.0.1,localhost"; # If you want to include a domain: "127.0.0.1,localhost,internal.domain"
    };

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    useDHCP = lib.mkDefault true;
  };
}
