{ pkgs, ... }:

{
  home-manager.users.adtya = { pkgs, ... }: {
    programs.helix.enable = true;
    programs.helix.settings = {
      theme = "dracula";
    };
  };
}
