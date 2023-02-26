{ ... }: {
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
