{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  stylix = {
    enable = true; # Enable stylix
    autoEnable = true; # Enable stylix color setting for all installed targets
    image = (
      ./../.. + (builtins.unsafeDiscardStringContext "/home-manager/desktop/wallpapers/wallpaper.jpg")
    ); # "./wallpapers/wallpaper.jpg"; # Wallpaper
    polarity = "dark"; # Dark/light theme
    imageScalingMode = "fill";
    base16Scheme = {
      base00 = "141c29";
      base01 = "80252a";
      base02 = "c92b2f";
      base03 = "dc878e";
      base04 = "c8b896";
      base05 = "f1e0c4";
      base06 = "fceed1";
      base07 = "f9eece";
      base08 = "a48f60";
      base09 = "ca7e36";
      base0A = "af8980";
      base0B = "989189";
      base0C = "e57334";
      base0D = "c7806a";
      base0E = "b2876c";
      base0F = "ce7776";
    };
    opacity = {
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
      terminal = 0.65;
    };
    fonts = {
      sizes = {
        applications = 14;
        desktop = 10;
        popups = 10;
        terminal = 15;
      };
      monospace = {
        name = "Couisine Nerd Font Mono";
        package = pkgs.nerd-fonts.cousine; # pkgs.nerd-fonts.sauce-code-pro
      };
      serif = {
        name = "DejaVu Serif"; # "Caladea"
        package = pkgs.dejavu_fonts; # pkgs.caladea pkgs.times-newer-roman
      };
      sansSerif = {
        name = "DejaVu Sans"; # "Source Sans 3"
        package = pkgs.dejavu_fonts; # pkgs.source-sans pkgs.carlito
      };
      emoji = {
        package = pkgs.unicode-emoji;
      };
    };
    cursor = {
      name = "Afterglow-Recolored-Catppuccin-Macchiato";
      package = pkgs.afterglow-cursors-recolored;
      size = 16;
    };

    targets.qt.platform = lib.mkForce "qtct";

    # targets.gtk.enable =true;
    # targets.gtk.flatpakSupport.enable = true;
  };
}
