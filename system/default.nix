{ lib, pkgs, ... }: {

  imports = [
    ./filesystem.nix
    ./gnome-keyring.nix
    ./gtk.nix
    ./hardware.nix
    ./nix.nix
    ./packages.nix
    ./persistence.nix
    ./plymouth.nix
    ./secureboot.nix
    ./services.nix
    ./swaylock.nix
    ./virtualisation.nix
  ];

  boot = {
    initrd.systemd.enable = true;
    kernel.sysctl = {
      "vm.swappiness" = 0;
    };
    loader.timeout = 0;
  };

  console.useXkbConfig = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
    };
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  };

  networking = {
    hostName = "Skipper";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault false;
  };

  security = {
    polkit.enable = true;
    tpm2 = {
      enable = true;
      abrmd.enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
    sudo = {
      package = pkgs.sudo.override { withInsults = true; };
      extraConfig = ''
        Defaults lecture="never"
      '';
      wheelNeedsPassword = true;
    };
  };

  sound.enable = true;

  time.timeZone = "Asia/Kolkata";

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  system.stateVersion = "23.05";
}
