{ pkgs, ... }:

{
  imports = [
    ./tmux.nix
    ./kitty.nix
    ./nvim.nix
    ./helix.nix
    ./terminal.nix
    ./dev.nix
    ./scripts.nix

    #  ./gnome.nix
    ./sway.nix
  ];

  home-manager.useUserPackages = true;
  home-manager.users.adtya = { pkgs, ... }: {
    home.stateVersion = "22.11";
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      discord
      spotify
      _1password-gui
      # zoom-us

      gnome.nautilus
      gnome.gnome-system-monitor
      evince

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
  };
}
