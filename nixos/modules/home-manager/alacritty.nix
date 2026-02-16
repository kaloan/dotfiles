{config, pkgs, ...}:

{
programs.alacritty = {
    enable = true;
    theme = "gotham";
    settings = {
      window = {
        dynamic_padding = true;
        opacity = 0.65;
        startup_mode = "Maximized";
        decorations_theme_variant = "Dark";
      };
      scrolling.multiplier = 5;
      font = {
        normal = {
          family = "Cousine Nerd Font Mono";
          style = "Regular";
        };
        size = 15;
      };
      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };
      terminal = {
        shell = "/run/current-system/sw/bin/fish"; # For NixOS
        # shell = "/bin/fish"; # For standard distributions
        # osc52 = "CopyPaste"; # "OnlyCopy"
      };
    };
  };
}
