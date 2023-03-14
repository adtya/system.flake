{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font 16";
    theme = ./theme.rasi;
  };
}
