{ ... }:
{
  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"

      "/var/lib/docker"
      "/var/lib/libvirt"

      "/var/log"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
