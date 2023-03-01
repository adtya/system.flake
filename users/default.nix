{ pkgs, ... }:

{
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
  fileSystems = {
    "/home/adtya/Documents" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@data/documents" "compress-force=zstd" ];
    };
    "/home/adtya/Downloads" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@data/downloads" "compress-force=zstd" ];
    };
    "/home/adtya/Music" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@data/music" "compress-force=zstd" ];
    };
    "/home/adtya/Others" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@data/others" "compress-force=zstd" ];
    };
    "/home/adtya/Pictures" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@data/pictures" "compress-force=zstd" ];
    };
    "/home/adtya/Projects" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@data/projects" "compress-force=zstd" ];
    };
    "/home/adtya/Videos" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@data/videos" "compress-force=zstd" ];
    };
  };
}
