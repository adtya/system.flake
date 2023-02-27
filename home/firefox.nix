{ pkgs, ... }:
{
  programs = {
    firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "Default";
        isDefault = true;

        # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #   dracula-dark-colorscheme
        #   onepassword-password-manager
        # ];
      };
    };
    librewolf.enable = true;
  };
}
