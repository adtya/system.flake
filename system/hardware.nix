{ lib, pkgs, config, ... }:

{
  imports = [ ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXSYSTEM";
      fsType = "btrfs";
      options = [ "subvol=/@" "compress-force=zstd" ];
    };
    "/mnt/data" = {
      device = "/dev/disk/by-label/NIXSYSTEM";
      fsType = "btrfs";
      options = [ "subvol=/@data" "compress-force=zstd" ];
    };
    "/mnt/system" = {
      device = "/dev/disk/by-label/NIXSYSTEM";
      fsType = "btrfs";
      options = [ "subvol=/" "compress-force=zstd" ];
    };
    "/boot" = {
      device = "/dev/disk/by-label/NIXESP";
      fsType = "vfat";
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/NIXSWAP"; }
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    pulseaudio.enable = false;
  };

  hardware.bluetooth.enable = true;
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';
    extraModulePackages = [ ];
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "vmd"
        "nvme"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      kernelModules = [ "i915" ];
    };
    kernel.sysctl = {
      "vm.swappiness" = 10;
    };
    kernelModules = [ "kvm-intel" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    plymouth.enable = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
