{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  environment.gnome = {
    excludePackages = with pkgs; [
      gnome-console
      gnome-photos
      gnome-tour
      gnome.epiphany
      gnome.gnome-clocks
      gnome.gnome-contacts
      gnome.gnome-maps
      gnome.gnome-music
      gnome.gnome-terminal
      gnome.gnome-weather
    ];
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel

    gnome.gnome-tweaks
  ];

  services.gnome.gnome-keyring.enable = true;

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];

  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
}
