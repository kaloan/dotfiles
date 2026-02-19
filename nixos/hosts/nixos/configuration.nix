# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# and https://nixos.org/nixos/options.html.

# IMPORTANT: Typical scripts and custom configuration for other distributions may not work on NixOS. One major cause is the difference in installation locations. E.g. '/run/current-system/sw/share' is the typical '/usr/share'. '/run/current-system/sw/bin' is the a mix ofthe typical '/bin' and '/usr/local/bin'. In general the '/run/current-system/' is akin to the typical '/'.
{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports =
  let
    # The following is a hack, since the NixOS build process depends on git and therefore does not use files that are gitignored.
    # IMPORTANT: Must also run "nixos-rebuild" with the "--impure" option.
    flakeRootPath = "/etc/nixos"; # Full path to directory with flake file. You can symlink the default NixOS configuration directory to the actual one and leave this unchanged.
    configurationRelativePath = "hosts/nixos"; # Relative path of this file to the path in `flakeRootPath`
  in
  [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix

    ../../modules/nixos/audio.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/desktop/gnome.nix

    # The following are likely to be host-specific and left best to be kept private
    ./examples/networking.nix
    "${flakeRootPath}/${configurationRelativePath}/networking.nix"
    ./examples/ssh.nix
    "${flakeRootPath}/${configurationRelativePath}/ssh.nix"
    ./examples/system.nix
    "${flakeRootPath}/${configurationRelativePath}/system.nix"
    ./examples/users.nix
    "${flakeRootPath}/${configurationRelativePath}/users.nix"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { # Link users to specific personal configuration files.
      "kaloan" = import ./home.nix;
    };
    # By default Home Manager tries to create some config files
    # If they already exist, instead of overwriting, the configuration switch fails
    backupFileExtension = "backup"; # This option just renames the existing files by appending this string as an extension. Equivalent to setting the "-b" CLI option.
    # overwriteBackup = true; # Uncomment if you want to have only 1 backup when using `home-manager.backupFileExtension`
    # backupCommand = ${pkgs.trash-cli}/bin/trash; # Execute ${home-manager.backupCommand} with the file as a CLI argument when a file already exists
  };

  # Install firefox.
  programs.firefox.enable = true; # Works fine as a backup browser.

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #nvtop
    alacritty # A good fast multiplatform minimalistic terminal. No tab functionality, so consider using tmux.
    alacritty-theme # Themes for alacritty.
    borgbackup
    btop # A process and resource usage viewer. Use `Escape` for help.
    clang-tools # Extras for clang.
    cmake # Tool used for compiling various projects.
    cpufetch # CPU details
    curl # Tool for HTTP requests
    dnsmasq # Required for some networking for virtualisation.
    fastfetch # General hardware and OS details
    ffmpeg-full # Converter of video formats. Sometimes required for video file thumbnails.
    fzf # Fast search
    gcc # C compiler
    gimp3 # Image editing tool
    git # Version control system.
    glances # System and ntwork monitor
    imagemagick # Converter of image formats.
    inkscape # Vector graphics editor.
    jq
    killall # Easy process terminator.
    libgcc
    libnotify
    libreoffice # Office suite, compatible with the shitty Microsoft formats.
    librewolf # Firefox-based privacy-oriented browser.
    libvirt # Higher level tool for virtual machines.
    lm_sensors
    lua
    lua-language-server
    mpv
    neovim # Good text editor and potential IDE.
    nixd # Nix language server
    nixfmt # Nix formatter.
    pkg-config
    protonup-ng
    qemu_kvm # Low level virtual machine manager.
    texliveFull # All the TeX packages.
    vim # Terminal text editor. Can be used as a backup if you have managed to trash both your nvim configuration and your DE.
    virt-manager # Graphical virtual machine manager.
    vscodium # Free (as in freedom) VSCode alternative.
    wget # Tool for HTTP requests
    yt-dlp # Video downloader for many platforms.
  ];

  # Nice shell with autocomplete.
  # INPORTANT: There are some differences to bash, so scripts may not be run directly and would require a rewrite.
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # PGP tool. Can also be useful for verifying checksums.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # IMPORTANT: Nerd fonts are required for most of the goodlooking statuslines and shell prompts.
  fonts.packages = with pkgs; [
    nerd-fonts.cousine
    nerd-fonts.sauce-code-pro
  ];


}
