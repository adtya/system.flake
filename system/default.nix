{ lib, pkgs, ... }:

{
  imports = [
    ./gnome-keyring.nix
    ./gtk.nix
    ./hardware.nix
    ./persistence.nix
    ./plymouth
    ./secureboot.nix
    ./swaylock.nix
    ./virtualisation.nix
    ./plymouth
  ];

  nix.settings.substituters = [
    "https://nix-community.cachix.org/"
  ];
  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;

  boot.tmpOnTmpfs = true;
  console.useXkbConfig = true;

  fonts.fonts = with pkgs; [
    cantarell-fonts
    fira-code
    fira-code-symbols
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
      LC_ALL = "en_IN";
    };
    supportedLocales = [ "en_IN/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  networking.hostName = "Skipper";
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault false;

  programs.git = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.xwayland.enable = true;

  security.polkit.enable = true;
  security.sudo = {
    package = pkgs.sudo.override { withInsults = true; };
    extraConfig = ''
      Defaults lecture="never"
    '';
    wheelNeedsPassword = true;
  };

  services = {
    dbus.enable = true;
    dbus.packages = [ pkgs.gcr pkgs.gcr_4 ];
    blueman.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    udisks2.enable = true;
  };

  sound.enable = true;

  system.stateVersion = "22.11";

  time.timeZone = "Asia/Kolkata";

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
