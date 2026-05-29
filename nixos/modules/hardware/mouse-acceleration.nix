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
      sensMultiplier = 1.0; # Base sensitivity multiplier
      yxRatio = 1.0; # Y to X axis sensitivity ratio
      inputDpi = 800.0; # Used to normalize to 1000 DPI for consistent acceleration
      angleRotation = 0.0; # In degrees, only works with Linux kernels >=6.11, change only if there are mouse sensor problems or you have phisical mobility issues
      mode = "synchronous"; # "linear", "natural", "synchronous" or "no_accel"

      # Linear mode
      acceleration = 0.15; # Determines how quickly the maximum acceleration is reached - higher is faster
      offset = 4.0; # Minimum mouse speed when acceleration starts taking place
      outputCap = 1.5; # Upper bound of acceleration, might not ever be reached if `acceleration` is low

      # Natural mode
      decayRate = 0.1; # Determines how quickly the maximum acceleration is reached - higher is faster. Soft caps at about 0.5-1
      # offset = 4.0; # Minimum mouse speed when acceleration starts taking place
      limit = 1.5; # Upper bound of acceleration, might not ever be reached if `decayRate` is low

      # Synchronous mode
      gamma = 1.0; # Exponent controlling the curve shape - higher is faster. Both low and high values cause weird behavior, so set to 1-10.
      syncSpeed = 6.0; # Determines how quickly the maximum acceleration is reached - lower is faster
      smooth = 1.0; # Smoothing factor in range 0-1. Lower values sometimes cause weird behavior, so set to >=0.5.
      motivity = 1.5; # Upper bound of acceleration, might not ever be reached if `syncSpeed` is high
    };
  };
}
