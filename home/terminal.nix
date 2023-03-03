{ pkgs, ... }:

{
  imports = [
    ./tmux.nix
  ];

  programs = {
    atuin.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    exa = {
      enable = true;
      enableAliases = true;
      extraOptions = [ "--group-directories-first" ];
      git = true;
      icons = true;
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        git_metrics.disabled = false;
      };
    };
    zsh = {
      enable = true;
      defaultKeymap = "viins";
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      initExtra = ''unsetopt BEEP'';
      initExtraBeforeCompInit = ''bindkey -v '^?' backward-delete-char'';
      profileExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ] ; then
          exec ${pkgs.sway}/bin/sway
        fi
      '';
      shellAliases = {
        cat = "bat";
      };
    };

    bat = {
      enable = true;
      config = {
        theme = "Dracula";
      };
    };
  };
}
