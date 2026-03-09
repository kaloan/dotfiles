{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/obs.nix

    ../../modules/home-manager/desktop/dconf.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kaloan";
  home.homeDirectory = "/home/kaloan";

  # # By default Home Manager tries to create some config files
  # # If they already exist, instead of overwriting, the configuration switch fails
  # home-manager.backupFileExtension = "backup"; # This option just renames the existing files by appending this string as an extension. Equivalent to setting the "-b" CLI option.
  # # home-manager.overwriteBackup = true; # Uncomment if you want to have only 1 backup when using `home-manager.backupFileExtension`
  # # home-manager.backupCommand = ${pkgs.trash-cli}/bin/trash; # Execute ${home-manager.backupCommand} with the file as a CLI argument when a file already exists

  # dconf = {
  #   enable = true;
  #   settings."org/gnome/Console" = {
  #     shell = [ "fish" ];
  #   };
  # };

  xdg.desktopEntries.librewolf = {
    name = "LibreWolf";
    exec = "${pkgs.librewolf}/bin/librewolf --private-window";
  };

  xdg.configFile."mimeapps.list".force = true; # To rewrite the mime ~/.config/mimeapps.list file with the provided list bellow
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "audio" = "mpv.desktop";
      "video" = ["mpv.desktop" "vlc.desktop"];
      "text/plain" = "vscodium";
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };

  # xdg.configFile."fish/config.fish".force = true; # To rewrite the main configuration file for the fish shell

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # dracula-theme.theme-dracula
      # vscodevim.vim
      # yzhang.markdown-all-in-one
    ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kaloan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "vscodium";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
