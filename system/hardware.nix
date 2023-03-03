{ lib, pkgs, config, ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@" "compress-force=zstd" ];
    };
    "/nix" = {
      device = "/dev/system/root";
      fsType = "btrfs";
      options = [ "subvol=/@nix" "compress-force=zstd" ];
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

  swapDevices = [
    { device = "/dev/system/swap"; }
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    pulseaudio.enable = false;
  };

  hardware.bluetooth.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    extraModprobeConfig = ''
      options hid_apple fnmode=2
    '';
    extraModulePackages = [ ];
    initrd = {
      luks.devices = {
        crypt = {
          allowDiscards = true;
          bypassWorkqueues = true;
          device = "/dev/disk/by-partlabel/SYSTEM";
          preLVM = true;
        };
      };
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
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
