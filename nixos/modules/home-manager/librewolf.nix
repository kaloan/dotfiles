{
  config,
  pkgs,
  ...
}:

{
  programs.librewolf = {
    enable = true;
    profiles."default".settings = {
      "browser.urlbar.decodeURLsOnCopy" = true;
    };
  };
}
