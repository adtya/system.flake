{ pkgs, ... }:

{
  home-manager.users.adtya = { pkgs, ... }: {
    services.gnome-keyring.enable = true;
    services.gpg-agent.enable = true;
    services.gpg-agent.pinentryFlavor = "gnome3";
  };
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.passwd.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
