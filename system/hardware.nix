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

  boot.loader = {
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
