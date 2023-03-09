{ ... }: {
  boot.tmpOnTmpfs = true;
  fileSystems = {
    "/" = {
      device = "tmpfs";
      fsType = "tmpfs";
      options = [ "defaults" "uid=0" "gid=0" "mode=0755" ];
      neededForBoot = true;
    };
    "/nix" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@nix" "compress-force=zstd" ];
      neededForBoot = true;
    };
    "/persist" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@persist" "compress-force=zstd" ];
      neededForBoot = true;
    };
    "/mnt/system" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/" "compress-force=zstd" ];
    };
    "/boot" = {
      device = "/dev/disk/by-partlabel/BOOT";
      fsType = "vfat";
    };
  };
}
