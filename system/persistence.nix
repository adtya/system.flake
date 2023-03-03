{ ... }:
{
  environment.persistence."/persist/system" = {
    directories = [
      "/etc/NetworkManager/system-connections"

      "/var/cache/powertop"

      "/var/lib/docker"
      "/var/lib/libvirt"

      "/var/log"
    ];
    files = [
      "/etc/machine-id"
    ];
  };
}
