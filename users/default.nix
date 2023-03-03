{ pkgs, ... }:

{
  services.getty.autologinUser = "adtya";
  users.mutableUsers = false;
  users.users = {
    root.hashedPassword = "$y$j9T$xLZV3Xd.xBb3L2iXy1MPD/$eyvDDYu5lMhqXERgkpp0oBItiszp0rmh1siXAMpTJcB";
    adtya = {
      hashedPassword = "$y$j9T$WOLGsPx.0lb9nSD4Jf6mz1$SokbnAJ8RV/CmnKe5/8rBt66dRHcW.tFabV1q9ZWlPB";
      description = "Adithya Nair";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];
      shell = pkgs.zsh;
    };
  };
}
