{ lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./gnome-keyring.nix
    ./gtk.nix
    ./swaylock.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;

  boot.tmpOnTmpfs = true;
  console.useXkbConfig = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
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
  };

  networking.hostName = "Skipper";
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault false;

  environment.systemPackages = with pkgs; [
    xdg-user-dirs
  ];

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

  security.sudo.wheelNeedsPassword = true;

  services = {
    dbus.enable = true;
    dbus.packages = [ pkgs.gcr ];
    blueman.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    udisks2.enable = true;
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      videoDrivers = [ "modesetting" ];
      libinput.enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      layout = "in";
      xkbVariant = "eng";
    };
  };

  sound.enable = true;

  system.stateVersion = "22.11";

  time.timeZone = "Asia/Kolkata";

  virtualisation.docker.enable = true;

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
