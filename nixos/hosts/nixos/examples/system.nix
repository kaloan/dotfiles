{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
    system = {
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "26.05"; # Did you read the comment?

    switch.enable = true; # Set to false in images
    activatable = true; # Set to false in images

    # This can be used to auto upgrade the system
    autoUpgrade = {
      enable = false;
      dates = "02:00";
      flake = "path:${config.users.users.myUser.home}/NixOS#${config.networking.hostName}"; #inputs.self.outPath
      flags = [
        "--update-input"
        "nixpkgs"
        # "--no-write-lock-file" # Only unpdate the current packages but don't change the lock file
        "-L" # print build logs
        # "--impure" # Build with referenced files not in the git history
      ];
      allowReboot = true;
    };
  };
}
