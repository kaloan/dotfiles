{
  config,
  pkgs,
  inputs,
  ...
}:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        # disable-user-extensions = true; # Optionally disable user extensions entirely

        # You can find information about the extensions at https://extensions.gnome.org/
        enabled-extensions = (map (ext: ext.extensionUuid) (with pkgs.gnomeExtensions; [
          # Put the extensions from nixpkgs that you want to enable here.
          simpleweather
          places-status-indicator
          removable-drive-menu
          caffeine
          clipboard-indicator
          system-monitor
          systemd-manager
          tor
        ])) ++ [
          # Alternatively, you can manually pass UUID as a string.
          # "blur-my-shell@aunetx"
          # ...
        ];

      };

      # Configure individual extensions
      "org/gnome/shell/extensions/caffeine" = {
        app-trigger-mode = 1;
        enable-fullscreen = false;
        show-notifications = false;
      };

      "org/gnome/shell/extensions/system-monitor" = {
        show-swap = false;
        show-upload = false;
        show-download = false;
      };

      "org/gnome/Console" = {
        shell = [ "fish" ];
      };

      "org/cinnamon/desktop/applications/terminal" = {
        exec = "alacritty";
      };

      "org/cinnamon/desktop/interface" = {
        can-change-accels = true;
      };

      "org/nemo/preferences" = {
        show-image-thumbnails = "always";
      };
    };
  };

  # GTK theming settings
  gtk = {
    enable = true;
    # IMPORTANT!: Manually setting the icon themes is necessary if using Stylix as some icons may be missing
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      # package = pkgs.kdePackages.breeze-icons;
      # name = "Breeze-Dark";
    };
  };
}
