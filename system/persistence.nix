{ ... }:
{
  environment.persistence."/persist/system" = {
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/secureboot"
      "/root/.cache/nix"
      "/var/cache/apparmor"
      "/var/lib/bluetooth"
      "/var/lib/docker"
      "/var/lib/libvirt"
      "/var/lib/NetworkManager"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/log"
    ];
    files = [
      "/etc/machine-id"
      "/var/lib/logrotate.status"
    ];
  };
}
