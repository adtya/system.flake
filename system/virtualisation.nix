{ pkgs, ... }: {
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ (pkgs.OVMFFull.override { secureBoot = true; tpmSupport = true; }).fd ];
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
