{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellInit = ''
      set __done_notification_command '${pkgs.libnotify}/bin/notify-send \$title \$message'
    '';
    # histSize = 10000; # zsh has this option
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      # {
      #   name = "async-prompt";
      #   src = pkgs.fishPlugins.async-prompt.src;
      # }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      # {
      #   name = "grc";
      #   src = pkgs.fishPlugins.grc.src;
      # }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      # Manually packaging and enable a plugin
      # {
      #   name = "z";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "jethrokuan";
      #     repo = "z";
      #     rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
      #     sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
      #   };
      # }
    ];
  };

  # Refer to https://ersei.net/en/blog/its-nixin-time
  # xdg.configFile = {
  #   "fish/conf.d/00-home-manager-vars.fish" = {
  #     enable = true;
  #     text = ''
  #       tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time=No --rainbow_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='One line' --prompt_spacing=Sparse --icons='Many icons' --transient=No
  #     '';
  #   };
  # };
}
