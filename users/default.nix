{ pkgs, ... }:

{
  users.users = {
    adtya = {
      description = "Adithya Nair";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      shell = pkgs.zsh;
    };
  };
}
