{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    cycle = false;
    package = pkgs.rofi-wayland;
    font = "FiraCode Nerd Font 16";
    extraConfig = {
      show-icons = true;
    };
    theme = ./theme.rasi;
  };
}
