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
    ];

    home.packages = with pkgs; [
      discord
      spotify
      _1password-gui

      gnome.nautilus
      gnome.gnome-system-monitor
      evince
      celluloid

      brightnessctl
      pavucontrol
    ];
    programs = {
      firefox.enable = true;
      librewolf.enable = true;
      gpg = {
        enable = true;
        settings = {
          keyserver = "hkps://keys.openpgp.org";
        };
      };
    };

    services.blueman-applet.enable = true;
    xdg.enable = true;

    home.stateVersion = "22.11";
  };
}
