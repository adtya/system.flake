{ pkgs, ... }:

{
  services.gnome-keyring.enable = true;
  services.gpg-agent.enable = true;
  services.gpg-agent.pinentryFlavor = "gnome3";
}
