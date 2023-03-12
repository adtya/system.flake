{ pkgs, ... }: {
  home.packages = [ pkgs.virt-manager ];
  dconf.settings = {
    "org/virt-manager/virt-manager/confirm" = {
      "forcepoweroff" = false;
    };
    "org/virt-manager/virt-manager/connections" = {
      "autoconnect" = [ "qemu:///system" ];
      "uris" = [ "qemu:///system" ];
    };
    "org/virt-manager/virt-manager/new-vm" = { "firmware" = "uefi"; };
    "org/virt-manager/virt-manager/stats" = {
      "enable-disk-poll" = true;
      "enable-net-poll" = true;
    };
    "org/virt-manager/virt-manager/vmlist-fields" = { "network-traffic" = true; };
  };
}
