{ lib, pkgs, ... }:
{
  boot.bootspec.enable = true;
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
    configurationLimit = 10;
  };
  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
