{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    escapeTime = 0;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-show-powerline true
          set -g @dracula-plugins "time"
          set -g @dracula-show-timezone false
          set -g @dracula-day-month true
          set -g @dracula-show-flags true
          set -g @dracula-show-left-icon session
        '';
      }
    ];
    extraConfig = ''
      set -g update-environment 'DISPLAY TERM SWAYSOCK WAYLAND_DISPLAY'
      if "[[ ''${TERM} =~ 256color || ''${TERM} == xterm-kitty || ''${TERM} == fbterm ]]" 'set -g default-terminal tmux-256color'
      set -g allow-rename on
      set -g set-titles on
      set -g set-titles-string "#W"
      set -g automatic-rename on
      set -g automatic-rename-format '(#{b:pane_current_path}) #{pane_current_command}'
      set -g status-position top
      set -g status-interval 1
      set -g mouse on

      set -g monitor-activity on
      set -g monitor-bell on
      set -g visual-activity on
      set -g visual-bell on

      set -g base-index 1
      setw -g pane-base-index 1

      bind - split-window -v -c "#{pane_current_path}"
      bind \\ split-window -h -c "#{pane_current_path}"
    '';
  };
}
