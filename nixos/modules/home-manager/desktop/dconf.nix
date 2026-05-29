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
        # enabled-extensions = builtins.concatLists
        # [
        #   (builtins.map
        #     # Put UUIDs of extensions that you want to enable here.
        #     # If the extension you want to enable is packaged in nixpkgs,
        #     # you can easily get its UUID by accessing its extensionUuid
        #     # field (look at the following example).
        #     (extension-name: pkgs.gnomeExtensions.${extension-name}.extensionUuid)
        #     [
        #       "extension-list"
        #       "places-status-indicator"
        #       "removable-drive-menu"
        #       "simpleweather"
        #       "system-monitor"
        #     ]
        #   )

        #   [
        #     # Alternatively, you can manually pass UUID as a string.
        #     # "blur-my-shell@aunetx"
        #     # ...
        #   ]
        # ];
        enabled-extensions = [
          # Put UUIDs of extensions that you want to enable here.
          # If the extension you want to enable is packaged in nixpkgs,
          # you can easily get its UUID by accessing its extensionUuid
          # field (look at the following example).
          pkgs.gnomeExtensions.extension-list.extensionUuid
          pkgs.gnomeExtensions.simpleweather.extensionUuid
          pkgs.gnomeExtensions.places-status-indicator.extensionUuid
          pkgs.gnomeExtensions.removable-drive-menu.extensionUuid
          pkgs.gnomeExtensions.caffeine.extensionUuid

          # Alternatively, you can manually pass UUID as a string.
          # "blur-my-shell@aunetx"
          # ...
        ];
      };

      # Configure individual extensions
      # "org/gnome/shell/extensions/blur-my-shell" = {
      #   brightness = 0.75;
      #   noise-amount = 0;
      # };
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
