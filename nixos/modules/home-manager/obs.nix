{
  config,
  pkgs,
  ...
}:

{
  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    # package = (
    #   pkgs.obs-studio.override {
    #     cudaSupport = true;
    #   }
    # );

    plugins = with pkgs.obs-studio-plugins; [
      # wlrobs # Better screen capture for Wayland
      # obs-backgroundremoval # Edits the background when capturing from a webcam
      obs-pipewire-audio-capture # Allows for more fine-grain audio source capture. Practically a must, since by default OBS Linux builds have no application specific audio capture.
      # obs-vaapi # optional AMD hardware acceleration
      # obs-gstreamer # Graph pipeline for various multimedia
      # obs-vkcapture # Allows capturing of Vulkan/OpenGL game video sources
      # obs-studio-plugins.obs-color-monitor # Detailed information about colors
    ];
  };
}
