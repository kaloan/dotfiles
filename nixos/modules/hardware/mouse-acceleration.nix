{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.maccel.nixosModules.default
  ];

  # Read https://github.com/Gnarus-G/maccel/blob/main/README_NIXOS.md
  hardware.maccel = {
    enable = true;
    enableCli = true; # Allows changing parameters through the CLI, session only, for real-time adjustments.
    parameters = {
      # Common (all modes)
      sensMultiplier = 1.0;
      yxRatio = 1.0;
      inputDpi = 800.0;
      angleRotation = 0.0; # In degrees, only works with Linux kernels >=6.11, change only if there are mouse sensor problems or you have phisical mobility issues
      mode = "synchronous"; # "linear", "natural", "synchronous" or "no_accel"

      # Linear mode
      # acceleration = 0.3;
      # offset = 2.0;
      # outputCap = 2.0;

      # Natural mode
      # decayRate = 0.1;
      # offset = 2.0;
      # limit = 1.5;

      # Synchronous mode
      gamma = 1.0;
      smooth = 0.5;
      motivity = 2.5;
      syncSpeed = 10.0;
    };
  };
}
