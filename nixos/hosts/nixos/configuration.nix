# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# and https://nixos.org/nixos/options.html.

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix

    ../../modules/nixos/audio.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/desktop/gnome.nix

    # The following are likely to be host-specific and left best to be kept private
    ./examples/networking.nix
    ./networking.nix
    ./examples/ssh.nix
    ./ssh.nix
    ./examples/system.nix
    ./system.nix
    ./examples/users.nix
    ./users.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.path = ["nixpkgs=${inputs.nixpkgs}"];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "kaloan" = import ./home.nix;
    };
    # By default Home Manager tries to create some config files
    # If they already exist, instead of overwriting, the configuration switch fails
    backupFileExtension = "backup"; # This option just renames the existing files by appending this string as an extension. Equivalent to setting the "-b" CLI option.
    # overwriteBackup = true; # Uncomment if you want to have only 1 backup when using `home-manager.backupFileExtension`
    # backupCommand = ${pkgs.trash-cli}/bin/trash; # Execute ${home-manager.backupCommand} with the file as a CLI argument when a file already exists
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #nvtop
    alacritty
    alacritty-theme
    borgbackup
    btop
    clang-tools
    cmake
    cpufetch
    curl
    fastfetch
    ffmpeg-full
    fzf
    gcc
    gimp3
    git
    imagemagick
    inkscape
    jq
    killall
    libgcc
    libnotify
    libreoffice
    librewolf
    lm_sensors
    lua
    lua-language-server
    mpv
    neovim
    nixfmt
    pkg-config
    protonup-ng
    texliveFull
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vscodium
    wget
    yt-dlp
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  fonts.packages = with pkgs; [
    nerd-fonts.cousine
    nerd-fonts.sauce-code-pro
  ];

}
