{
  config,
  pkgs,
  inputs,
  ...
}:

{
  stylix = {
    enable = true;
    image = (./. + (builtins.unsafeDiscardStringContext "/wallpapers/wallpaper.jpg")); # "./wallpapers/wallpaper.jpg"; # Wallpaper
    polarity = "dark"; # Dark/light theme
    # image = (./. + (builtins.unsafeDiscardStringContext "/modules/home-manager/desktop/wallpapers/wallpaper.jpg")); # "./wallpapers/wallpaper.jpg"; # Wallpaper
  };
}
