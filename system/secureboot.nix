{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
