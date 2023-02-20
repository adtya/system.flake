{ pkgs, ... }:

{
  home-manager.users.adtya = { pkgs, ... }: {
    programs.kitty = {
      enable = true;
      font.package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      font.name = "FiraCode Nerd Font Mono";
      theme = "Dracula";
      extraConfig = ''
        font_size	14
        initial_window_width	100c
        initial_window_height	25c
        window_padding_width	8.0
        background_opacity	0.98
        cursor_shape	beam
        scrollback_lines	2000
        copy_on_select	clipboard
        url_style	curly
        sync_to_monitor	yes
        shell_integration disabled
      '';
    };
  };
}
