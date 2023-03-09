{ ... }: {
  boot = {
    resumeDevice = "/dev/system/swap";
    initrd.luks.devices = {
      crypt = {
        allowDiscards = true;
        bypassWorkqueues = true;
        device = "/dev/disk/by-partlabel/SYSTEM";
        preLVM = true;
      };
    };
  };

  swapDevices = [{ device = "/dev/system/swap"; }];
}
