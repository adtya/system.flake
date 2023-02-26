{ pkgs, ... }:

{
  imports = [
    ./tmux.nix
    ./kitty.nix
    ./nvim.nix
    ./helix.nix
    ./terminal.nix
    ./scripts.nix


    ./sway/swaylock.nix
  ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.adtya = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    imports = [ ./dev.nix ./sway ];

    home.packages = with pkgs; [
      # discord
      # spotify
      # _1password-gui

      gnome.nautilus
      gnome.gnome-system-monitor
      evince
      mpv

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
