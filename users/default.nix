{ pkgs, ... }:

{
  users.mutableUsers = false;
  users.users = {
    adtya = {
      hashedPassword = "$y$j9T$WOLGsPx.0lb9nSD4Jf6mz1$SokbnAJ8RV/CmnKe5/8rBt66dRHcW.tFabV1q9ZWlPB";
      description = "Adithya Nair";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
      shell = pkgs.zsh;
    };
  };
}
