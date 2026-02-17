{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Xorg related settings
  services.xserver = {
    enable = true; # Enable the X11 windowing system.
    # Configure keymap in X11.
    # IMPORTANT: Wayland has no means of setting these values and as of 2026 only supports "xkb" format for "wl_keyboard.keymap" events Thus this keyboard configuration is used even when using Wayland.
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
