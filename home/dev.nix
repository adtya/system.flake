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
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
      extensions = [ pkgs.gh-dash pkgs.gh-eco ];
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
  };
}
