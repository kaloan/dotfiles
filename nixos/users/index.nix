{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { # Link users to specific personal configuration files.
      "kaloan" = import ./homes/kaloan.nix;
    };
    # By default Home Manager tries to create some config files
    # If they already exist, instead of overwriting, the configuration switch fails
    backupFileExtension = "backup"; # This option just renames the existing files by appending this string as an extension. Equivalent to setting the "-b" CLI option.
    # overwriteBackup = true; # Uncomment if you want to have only 1 backup when using `home-manager.backupFileExtension`
    # backupCommand = ${pkgs.trash-cli}/bin/trash; # Execute ${home-manager.backupCommand} with the file as a CLI argument when a file already exists
  };
}
