{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
  boot.loader.systemd-boot.enable = lib.mkForce false;
}
