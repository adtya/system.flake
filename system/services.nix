{ pkgs, ... }: {
  services = {
    blueman.enable = true;
    dbus = {
      enable = true;
      apparmor = "enabled";
      packages = [ pkgs.gcr pkgs.gcr_4 ];
    };
    fstrim.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    lvm.dmeventd.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    power-profiles-daemon.enable = true;
    thermald.enable = true;
    udisks2.enable = true;
  };
}
