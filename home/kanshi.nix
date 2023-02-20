{ config, lib, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.adtya = { pkgs, config, ... }: {
    services.kanshi.enable = true;
    services.kanshi.profiles = {
      undocked = {
        outputs = [];
      };
      docker
    };
  };
}
