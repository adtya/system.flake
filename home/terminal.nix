{ config, pkgs, ... }:

{
  imports = [
    ./tmux.nix
  ];

  programs = {
    atuin.enable = true;
    btop = {
      enable = true;
      settings = {
        color_theme = "dracula";
        vim_keys = true;
        update_ms = 1000;
      };
    };
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
      history = {
        expireDuplicatesFirst = true;
        extended = true;
        path = "${config.xdg.dataHome}/zsh/zsh_history";
      };
      initExtra = ''
        bindkey -v '^?' backward-delete-char
        unsetopt BEEP
      '';
      profileExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ] ; then
          exec ${pkgs.sway}/bin/sway
        fi
      '';
      shellAliases = {
        cat = "bat";
        cp = "cp -v";
        grep = "grep --color=auto";
        ln = "ln -v";
        mv = "mv -v";
        devenv_init = "nix flake init --template github:cachix/devenv";
        file = "nix run nixpkgs#file --";
        rebuild_system = "sudo nixos-rebuild --flake /persist/home/.system.flake# --cores 0 --max-jobs 8";
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
