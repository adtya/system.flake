{ pkgs, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.adtya = { pkgs, ... }: {

    imports = [
      ./sway

      ./dev.nix
      ./scripts.nix
      ./kitty.nix
      ./terminal.nix

      ./firefox.nix

      ./media.nix
    ];

    home.packages = with pkgs; [
      discord
      _1password-gui

      pantheon.elementary-files
      gnome.gnome-system-monitor
      gnome.eog
      evince
      celluloid
      gparted

      brightnessctl
      pavucontrol

      xdg-user-dirs
    ];

    programs = {
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
