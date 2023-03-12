{ pkgs, ... }:
let
  user = import ../users/user.nix;
in
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
      userEmail = user.primary.emailAddress;
      userName = user.primary.realName;
      signing = {
        key = user.primary.signingKey;
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
