{ pkgs, ... }: {
  virtualisation = {
    docker.enable = true;
    kvmgt.enable = true;
    libvirtd = {
      enable = true;
      qemu.ovmf = {
        enable = true;
        packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };
}
