{ pkgs, ... }:
let
  dracula = pkgs.fetchFromGitHub {
    owner = "dracula";
    repo = "kitty";
    rev = "87717a3f00e3dff0fc10c93f5ff535ea4092de70";
    hash = "sha256-78PTH9wE6ktuxeIxrPp0ZgRI8ST+eZ3Ok2vW6BCIZkc=";
  };
in
{
  programs.kitty = {
    enable = true;
    font.package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
    font.name = "FiraCode Nerd Font";
    extraConfig = ''
      font_size	14
      initial_window_width	100c
      initial_window_height	25c
      window_padding_width	4.0
      background_opacity	0.98
      cursor_shape	beam
      scrollback_lines	2000
      copy_on_select	clipboard
      url_style	curly
      sync_to_monitor	yes
      shell_integration disabled

      include ${dracula}/dracula.conf
    '';
    settings = {
      enable_audio_bell = false;
    };
  };
}
