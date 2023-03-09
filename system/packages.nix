{ pkgs, ... }: {

  fonts.fonts = with pkgs; [
    cantarell-fonts
    fira-code
    fira-code-symbols
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  programs = {
    git.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    xwayland.enable = true;
    zsh.enable = true;
  };
  environment.pathsToLink = [ "/share/zsh" ];
}
