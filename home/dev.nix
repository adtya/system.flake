{ pkgs, ... }:

{
  imports = [
    ./nvim.nix
    ./helix.nix

    ./code.nix
  ];

  home.packages = with pkgs; [
    ripgrep

    rnix-lsp
    nixpkgs-fmt
  ];
  programs = {
    gh.enable = true;
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
  };
}
