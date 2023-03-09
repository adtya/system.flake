{ impermanence, pkgs, ... }:

{
  programs.fuse.userAllowOther = true;

  fileSystems."/home/adtya" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [ "mode=0755" "uid=1000" "gid=100" ];
  };

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.adtya = { pkgs, ... }: {

    imports = [
      impermanence.nixosModules.home-manager.impermanence
      ./persistence.nix

      ./dev.nix
      ./email.nix
      ./firefox.nix
      ./kitty.nix
      ./media.nix
      ./scripts.nix
      ./sway
      ./terminal.nix
      ./virt-manager.nix
    ];

    home.packages = with pkgs; [
      _1password-gui
      _1password
      brightnessctl
      discord
      evince
      gnome.eog
      gnome.gnome-system-monitor
      gnome3.gnome-disk-utility
      libsecret
      pantheon.elementary-files
      pavucontrol
      xdg-utils
    ];

    dconf.settings = {
      "io/elementary/files/preferences" = {
        "singleclick-select" = true;
      };
      "org/gtk/settings/file-chooser" = {
        "sort-directories-first" = true;
      };
    };

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
    xdg.userDirs.enable = true;

    home.stateVersion = "23.05";
  };
}
