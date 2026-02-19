# Modification of https://github.com/vimjoyer/flake-starter-config

# IMPORTANT: Due to limitations of the flake.nix implementation (https://discourse.nixos.org/t/why-cant-i-use-let-variables-in-flake-nix-inputs/39929) the following nix expression is not allowed. Manually fill in the version at the specified locations.
# let
#   version = "25.11"; # Either exact version or "unstable"
# in
{
  description = "Nixos config flake";

  inputs =
  {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-${version}";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      # url = "github:nix-community/home-manager/release-${version}";
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Use this type of syntax if hosts differ in modules or require extra configuration
  # outputs = { self, nixpkgs, ... }@inputs:
  #   let
  #     configurationName = "nixos";
  #   in
  #   {
  #     nixosConfigurations."${configurationName}" = nixpkgs.lib.nixosSystem {
  #       specialArgs = { inherit inputs; };
  #       modules = [
  #         (./. + (builtins.unsafeDiscardStringContext "/hosts/${configurationName}/configuration.nix"))
  #         inputs.home-manager.nixosModules.default
  #       ];
  #     };
  #   };

  # Generalized version of above commented code if you will use multiple host configurations with this "default" structure
  outputs = { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations = builtins.foldl'
        (configs: host: {
          "${host}" = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              (./. + (builtins.unsafeDiscardStringContext "/hosts/${host}/configuration.nix"))
              inputs.home-manager.nixosModules.default
            ];
          };
        } // configs)
        {}
        [ "nixos" ]; # List of your host names
    };
}
