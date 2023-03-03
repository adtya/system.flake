{ impermanence, pkgs, ... }:

{
  programs.fuse.userAllowOther = true;

  #fileSystems."/home/adtya" = {
  #  device = "none";
  #  fsType = "tmpfs";
  #  options = [ ];
  #};

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.adtya = { pkgs, ... }: {

    imports = [
      "${impermanence}/home-manager.nix"
      ./persistence.nix

      ./sway
      ./dev.nix
      ./scripts.nix
      ./kitty.nix
      ./terminal.nix
      ./firefox.nix
      ./media.nix
    ];

    home.homeDirectory = "/home/adtya";

    home.packages = with pkgs; [
      _1password-gui
      brightnessctl
      celluloid
      discord
      evince
      gnome.eog
      gnome.gnome-system-monitor
      gnome3.gnome-disk-utility
      pantheon.elementary-files
      pavucontrol
      xdg-user-dirs
    ];

    programs = {
      home-manager.enable = true;
      gpg = {
        enable = true;
        settings = {
          keyserver = "hkps://keys.openpgp.org";
        };
      };
    };

    services.blueman-applet.enable = true;
    xdg.enable = true;
    xdg.mime.enable = true;
    xdg.mimeApps.enable = true;

    home.stateVersion = "22.11";
  };
}
