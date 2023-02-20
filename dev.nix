{ pkgs, ... }:

{
  home-manager.users.adtya = { pkgs, ... }: {
    home.packages = with pkgs; [
      ripgrep
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

      vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          dracula-theme.theme-dracula
          ms-azuretools.vscode-docker
          jnoortheen.nix-ide
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    rnix-lsp
    nixpkgs-fmt
  ];

  virtualisation.docker.enable = true;
}
