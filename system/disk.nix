{ ... }: {
  boot = {
    resumeDevice = "/dev/vg0/swap";
    initrd.luks.devices = {
      luks0 = {
        allowDiscards = true;
        bypassWorkqueues = true;
        device = "/dev/disk/by-partlabel/CRYPT";
        preLVM = true;
      };
    };
  };

  swapDevices = [{ device = "/dev/vg0/swap"; }];
}
