{ pkgs, ... }:

let
  user = import ./user.nix;
in
{
  services.getty.autologinUser = user.primary.userName;
  users.mutableUsers = false;
  users.users = {
    root.hashedPassword = user.root.hashedPassword;
    "${user.primary.userName}" = {
      uid = 1000;
      hashedPassword = user.primary.hashedPassword;
      description = user.primary.realName;
      isNormalUser = true;
      extraGroups = [ "docker" "libvirtd" "networkmanager" "tss" "wheel" ];
      shell = pkgs.zsh;
    };
  };
}
