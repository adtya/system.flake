{ pkgs, ... }:

{
  home-manager.users.adtya = { pkgs, ... }: {
    programs = {
      atuin.enable = true;
      direnv = {
        enable = true;
        nix-direnv.enable = true;
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
        initExtraBeforeCompInit = ''bindkey -v '^?' backward-delete-char'';
        profileExtra = ''
          if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ] ; then
            exec ${pkgs.sway}/bin/sway
          fi
        '';
      };

      bat = {
        enable = true;
        config = {
          theme = "Dracula";
        };
      };
    };
  };
}
