{ pkgs, ... }:

{
  imports = [
    ./nvim.nix
  ];

  home.packages = with pkgs; [
    devenv
    lazydocker
    nixpkgs-fmt
    ripgrep
  ];
  programs = {
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
      extensions = [ pkgs.gh-dash ];
    };
    git = {
      enable = true;
      diff-so-fancy = {
        enable = true;
      };
      userEmail = "adtya@adtya.xyz";
      userName = "Adithya Nair";
      signing = {
        key = null;
        signByDefault = true;
      };
      extraConfig = {
        init.defaultBranch = "main";
      };
      ignores = [ "/.nix" "/.direnv" ];
    };
    lazygit = {
      enable = true;
    };
  };
}
