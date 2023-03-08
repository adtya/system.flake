{ pkgs, ... }: {
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu.ovmf = {
        enable = true;
        packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };
}
