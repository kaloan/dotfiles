{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kaloan = {
    isNormalUser = true;
    description = "kaloan";
    extraGroups = [
      "networkmanager" # Allows doing network configuration changes without requiring administrator priviledges.
      "wheel" # A short form of the phrase "big wheel". Allows running switching user to root and running sudo.
      "kvm" # Allows running of KVMs.
      "libvirtd" # Allows running libvirt.
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
