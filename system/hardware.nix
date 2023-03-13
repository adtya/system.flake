{ lib, pkgs, config, ... }: {

  imports = [ ./disk.nix ./kernel.nix ];

  hardware.opengl = {
    enable = true;
    extraPackages = [ pkgs.intel-media-driver ];
    driSupport = true;
  };

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault true;
    enableRedistributableFirmware = true;
  };

  hardware.bluetooth.enable = true;

  hardware.sensor.hddtemp = {
    enable = true;
    drives =  [ "/dev/disk/by-path/pci-0000:01:00.0-nvme-1" ];
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
